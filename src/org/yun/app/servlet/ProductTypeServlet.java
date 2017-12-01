/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月18日
* Time: 上午10:10:32
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

@WebServlet("/productType.html")
public class ProductTypeServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8814016788830289308L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageStr = req.getParameter("page");
		String word = req.getParameter("wd");
		CommonDAOImpl dao = new CommonDAOImpl();
		int total = dao.findTotal("SELECT COUNT(productID) FROM tb_Product WHERE productType = ?", new Object[]{word});
		int numPerPage = 9;
		
		int totalPage = total % numPerPage == 0 ? total / numPerPage : total / numPerPage + 1;
		int page = 1;
		if(pageStr !=null && pageStr.matches("^[0-9]*[1-9][0-9]*$")){
			page = Integer.parseInt(pageStr);
		} 
		if (page > 0 && page <= totalPage) {
			int start = (page - 1) * numPerPage;
			List<Object> plist = dao.findByCondition(Product.class, "SELECT * FROM `tb_product` WHERE productType = ? order by sales desc limit ?, ?", new Object[]{word,start,numPerPage});
			if(plist.size()>0){
				req.setAttribute("plist", plist);
				req.setAttribute("wd", word);
				req.setAttribute("page", page);
				req.setAttribute("changepage", "productType.html");
				req.setAttribute("totalPage", totalPage);
				req.getRequestDispatcher("/WEB-INF/webPage/search.jsp").forward(req, resp);
			}else{
				req.setAttribute("wd", word);
				req.getRequestDispatcher("/WEB-INF/webPage/noSearchResult.jsp").forward(req, resp);
			}
		}else{
			req.setAttribute("wd", word);
			req.getRequestDispatcher("/WEB-INF/webPage/noSearchResult.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
