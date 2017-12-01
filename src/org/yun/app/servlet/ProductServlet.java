/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月13日
* Time: 上午9:18:22
*/

package org.yun.app.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Comment;
import org.yun.app.entity.ProDetails;
import org.yun.app.entity.ProImgDetails;
import org.yun.app.entity.Product;

@WebServlet("/product.html")
public class ProductServlet extends CommonServlet{

	private static final long serialVersionUID = -4318636483378490471L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idStr = req.getParameter("id");
		if(idStr==null||idStr==""){
			resp.sendRedirect("index.html");
		}else{
			int id = Integer.parseInt(idStr);
			CommonDAOImpl dao = new CommonDAOImpl();
			List<Object> ol = dao.findByCondition(Product.class, "SELECT * FROM tb_product WHERE productID = ?", new Object[] {id});
			List<Object> imgs =dao.findByCondition(ProImgDetails.class, "SELECT * FROM tb_proImgeDetails where productID = ?", new Object[] {id});
			List<Object> comment = dao.findByCondition(Comment.class, "SELECT * FROM tb_comment WHERE productID = ? order by addTime desc", new Object[] {id});
			List<Object> details = dao.findByCondition(ProDetails.class, "SELECT * FROM tb_proDetails WHERE productID = ?", new Object[]{id});
			if(ol.size()>0){
				Product p = (Product) ol.get(0);
				ProDetails detail= null;
				req.setAttribute("product", p);
				req.setAttribute("imgs", imgs);
				if(details.size()>0){
					detail = (ProDetails) details.get(0);
				}
				req.setAttribute("details", detail);
				req.setAttribute("comments", comment);
			req.getRequestDispatcher("/WEB-INF/webPage/product.jsp").forward(req, resp);
			}else{
				resp.sendRedirect("404.html");
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
