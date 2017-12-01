/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午10:08:14
*/

package org.yun.app.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Product;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/updateindex")
public class UpdateIndexPic extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3381922781314783047L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider = req.getParameter("id");
		String name = req.getParameter("name");
		req.setAttribute("id", ider);
		req.setAttribute("name", name);
		req.getRequestDispatcher("/WEB-INF/webPage/dashboard/updateindexpic.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider = req.getParameter("id");
		String word = req.getParameter("word");
		String fuword = req.getParameter("fuword");
		int id = new Integer(ider);
		CommonDAOImpl dao = new CommonDAOImpl();
		List<Object> product =dao.findByCondition(Product.class, "SELECT * FROM tb_product where productID = ?", new Object[]{id});
		Product temp = (Product) product.get(0);
		Object[] param = new Object[]{id,temp.getProductName(),temp.getPrice(),temp.getImgPath(),word,fuword};
		new CommonDAOImpl().updateDataBase("INSERT INTO tb_indexPic (productID,productName,price,imagPath,word,fu_word) VALUES (?,?,?,?,?,?)",param);
		resp.sendRedirect("indexPic.html");
	}
}
