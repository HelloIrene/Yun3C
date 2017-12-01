package org.yun.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.entity.Backproduct;
import org.yun.app.entity.Product;
import org.yun.app.servlet.CommonServlet;
import org.yun.app.dao.CommonDAOImpl;

@WebServlet("/backproduct-hot.html")
public class BackThingListServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3689736347724659562L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		int total = dao.findTotal("SELECT COUNT(productID) FROM tb_product", null);
		int numPerPage = 9;
		
		int totalPage = total % numPerPage == 0 ? total / numPerPage : total / numPerPage + 1;
		String pageStr = req.getParameter("page");
		int page = 1;
		if(pageStr !=null && pageStr.matches("^[0-9]*[1-9][0-9]*$")){
			page = Integer.parseInt(pageStr);
		} 
		if (page > 0 && page <= totalPage) {
			int start = (page - 1) * numPerPage;
			List<Object> plist = dao.findByCondition(Product.class, "SELECT * FROM tb_product order by sales desc limit ?, ?", new Object[]{start,numPerPage});
			req.setAttribute("plist", plist); 
			req.setAttribute("page", page);
			req.setAttribute("wd", "×î½üÈÈÂô");
			req.setAttribute("changepage", "backproduct-hot.html");
			req.setAttribute("totalPage", totalPage);
			req.getRequestDispatcher("/WEB-INF/webPage/backsearch.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
