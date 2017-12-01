/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午2:37:46
*/

package org.yun.app.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Product;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/recommend.html")
public class RecommendServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5767077265977476897L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		List<Object> recommends = dao.findByCondition(Product.class,"SELECT * FROM tb_Product where productID = ANY (SELECT productID FROM tb_recommend) order by sales desc", null);
		System.out.println(recommends.size());
		req.setAttribute("recommends", recommends);
		List<Object> norecommends = dao.findByCondition(Product.class,"SELECT * FROM tb_Product where productID NOT IN (SELECT productID FROM tb_recommend) order by sales desc", null);
		System.out.println(norecommends.size());
		req.setAttribute("norecommends", norecommends);
		req.getRequestDispatcher("/WEB-INF/webPage/dashboard/recommend.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
