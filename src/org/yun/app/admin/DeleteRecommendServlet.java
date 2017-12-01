/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午3:43:10
*/

package org.yun.app.admin;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.servlet.CommonServlet;
@WebServlet("/dashboard/deleterecommend")
public class DeleteRecommendServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5949036101553882349L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider = req.getParameter("id");
		int id = new Integer(ider);
		new CommonDAOImpl().updateDataBase("DELETE FROM tb_recommend WHERE productID = ? ", new Object[]{id});
		resp.sendRedirect("recommend.html");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
