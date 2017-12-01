package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.CartPage;

/**
 * Servlet implementation class CartDeleteProductServlet
 */
@WebServlet("/CartDeleteProductServlet.html")
public class CartDeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println(1);
		response.setContentType("text/;html");
		List<CartPage> tempCart = (List<CartPage>) request.getSession().getAttribute("cartPages");
		int cartId = tempCart.get(0).getCartId();
		int productId = Integer.parseInt(request.getParameter("id"));
		CommonDAOImpl commDao = new CommonDAOImpl();
		String sql = "DELETE FROM tb_cartitem WHERE cartId=? AND productId=?";
		int row = commDao.updateDataBase(sql, new Object[] { cartId, productId });
		PrintWriter out = response.getWriter();
		if(row>0){
			out.print(true);
		}else{
			out.print(false);
		}
		int a = (int) request.getSession().getAttribute("num");
		request.getSession().setAttribute("num", a-1);
		out.flush();
		out.close();
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
