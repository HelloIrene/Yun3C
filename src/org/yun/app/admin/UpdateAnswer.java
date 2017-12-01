/**
* Created by Eclipse.
* User: zyy
* Date: 2017��10��17��
* Time: ����3:25:26
*/


package org.yun.app.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.servlet.CommonServlet;

@WebServlet("/dashboard/updateQuestion.html")
public class UpdateAnswer extends CommonServlet{

	/**
	 * �޸������ʼ��
	 */
	private static final long serialVersionUID = -25378614975037639L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String a = req.getParameter("a");
		String id = req.getParameter("id");
		int idTemp = new Integer(id);
		int row = new CommonDAOImpl().updateDataBase("UPDATE tb_qna SET answer = ? WHERE questionID = ? ", new Object[]{a,idTemp});
		PrintWriter pw = resp.getWriter();
		if(row != 0){
			pw.print("<span id='Waring' style='color:red'>" + "���³ɹ���" +"</span>");
		}else{
			pw.print("<span id='Waring' style='color:red'>" + "����ʧ�ܣ�" +"</span>");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
