/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月17日
* Time: 下午2:16:54
*/


package org.yun.app.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/deleteQuestion.html")
public class DeleteQuestion extends CommonServlet{

	/**
	 * 后台删除无效留言
	 */
	private static final long serialVersionUID = -725890996778549274L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ider=req.getParameter("id");
		if(ider==null||ider==""){
			resp.sendRedirect("answer.html");
		}else{
			int id = new Integer(ider);
			int row = new CommonDAOImpl().updateDataBase("DELETE FROM tb_qna WHERE questionID = ? ", new Object[]{id});
			if(row!=0){
				resp.sendRedirect("answer.html");
			}
		}
	}

}
