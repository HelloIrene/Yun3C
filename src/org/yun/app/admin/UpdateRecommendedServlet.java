/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午3:32:08
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

@WebServlet("/dashboard/updaterecommend")
public class UpdateRecommendedServlet extends CommonServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1021434060147241545L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider = req.getParameter("id");
			int id = new Integer(ider);
			Timestamp addTime=new Timestamp(System.currentTimeMillis());
			new CommonDAOImpl().updateDataBase("INSERT INTO tb_recommend (productID,addTime) VALUES (?,?)", new Object[]{id,addTime});
			resp.sendRedirect("recommend.html");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
