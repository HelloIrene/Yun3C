/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月22日
* Time: 下午6:19:28
*/

package org.yun.app.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.User;

@WebServlet("/updateComment.html")
public class UpdateCommonServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7439357009420610228L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("loginname");
		String commentTitle = req.getParameter("commentTitle");
		String content = req.getParameter("content");
		Timestamp addTime = new Timestamp(System.currentTimeMillis());
		Integer productID = new Integer(req.getParameter("productID"));
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Integer userID = user.getUserID();
		String userName = user.getLoginname();
		Integer star = new Integer(req.getParameter("star"));
		Object[] params = new Object[]{productID,commentTitle,content,star,userID,userName,addTime};
		//INSERT INTO tb_commment (productID,commentTitle,content,star,userID,userName,addTime) VALUES (?,?,?,?,?,?,?) 
		int row = new CommonDAOImpl().updateDataBase("INSERT INTO tb_comment (productID,commentTitle,content,star,userID,userName,addTime) VALUES (?,?,?,?,?,?,?)", params);
		if(row!=0){
			resp.sendRedirect("product.html?id="+productID);
		}else{
			resp.sendRedirect("product.html?id="+productID);
		}
	}
}
