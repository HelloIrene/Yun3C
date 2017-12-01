/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午10:05:46
*/

package org.yun.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/deleteindex")
public class DeleteIndexPic extends CommonServlet{

	

	/**
	 * 
	 */
	private static final long serialVersionUID = -3035103943495454034L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider = req.getParameter("id");
		int id = new Integer(ider);
		new CommonDAOImpl().updateDataBase("DELETE FROM tb_indexPic WHERE productID = ? ", new Object[]{id});
		resp.sendRedirect("indexPic.html");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
