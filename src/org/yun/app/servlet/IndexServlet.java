/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月13日
* Time: 上午10:17:12
*/

package org.yun.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.IndexPic;
import org.yun.app.entity.Product;

@WebServlet("/index.html")
public class IndexServlet extends CommonServlet{

	/**
	 * 首页的servlet
	 */
	private static final long serialVersionUID = -171834451514869411L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		int numPerPage = 4;
		int start = 0;
		List<Object> plist = dao.findByCondition(Product.class, "SELECT * FROM tb_Product order by sales desc limit ?, ?", new Object[]{start,numPerPage});
		req.setAttribute("plist", plist); 
		List<Object> plist2 = dao.findByCondition(Product.class, "SELECT * FROM tb_Product where productID = ANY (SELECT productID FROM tb_recommend) order by sales desc limit ?, ?", new Object[]{start,numPerPage});
		req.setAttribute("plist2", plist2); 
		List<Object> plist3 = dao.findByCondition(IndexPic.class, "SELECT * FROM tb_indexPic", null);
		req.setAttribute("plist3", plist3);
		req.getRequestDispatcher("/WEB-INF/webPage/index.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
