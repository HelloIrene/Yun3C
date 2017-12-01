/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月18日
* Time: 上午11:29:30
*/

package org.yun.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Product;

@WebServlet("/recommend.html")
public class RecommendServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6360454845628488424L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		int total = dao.findTotal("SELECT COUNT(productID) FROM tb_recommend", null);
		int numPerPage = 9;
		
		int totalPage = total % numPerPage == 0 ? total / numPerPage : total / numPerPage + 1;
		String pageStr = req.getParameter("page");
		int page = 1;
		if(pageStr !=null && pageStr.matches("^[0-9]*[1-9][0-9]*$")){
			page = Integer.parseInt(pageStr);
		} 
		if (page > 0 && page <= totalPage) {
			int start = (page - 1) * numPerPage;
			List<Object> plist = dao.findByCondition(Product.class, "SELECT * FROM tb_Product where productID = ANY (SELECT productID FROM tb_recommend) order by sales desc limit ?, ?", new Object[]{start,numPerPage});
			req.setAttribute("plist", plist); 
			req.setAttribute("page", page);
			req.setAttribute("wd", "精品推荐");
			req.setAttribute("changepage", "recommend.html");
			req.setAttribute("totalPage", totalPage);
			req.getRequestDispatcher("/WEB-INF/webPage/search.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);	
	}
}
