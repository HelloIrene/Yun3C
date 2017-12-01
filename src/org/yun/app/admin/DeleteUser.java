/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午8:58:23
*/

package org.yun.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/deleteuser")
public class DeleteUser extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6555656713896729625L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider = req.getParameter("id");
		int id = new Integer(ider);
		new CommonDAOImpl().updateDataBase("DELETE FROM tb_user WHERE userID = ?", new Object[]{id});
		resp.sendRedirect("userlist.html");	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
