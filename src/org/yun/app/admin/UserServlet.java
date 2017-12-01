/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午7:04:55
*/

package org.yun.app.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.News;
import org.yun.app.entity.User;
import org.yun.app.servlet.CommonServlet;
@WebServlet("/dashboard/userlist.html")
public class UserServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8742578347254812333L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Object> users = new CommonDAOImpl().findByCondition(User.class, "SELECT * FROM tb_user", null);
		if(users.size()>0){
			req.setAttribute("users", users);
			req.getRequestDispatcher("/WEB-INF/webPage/dashboard/Users.jsp").forward(req, resp);
			
		}else{
			resp.sendRedirect("404.html");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
