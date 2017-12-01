/**
* Created by Eclipse.
* User: zyy
* Date: 2017��10��13��
* Time: ����3:30:13
*/


package org.yun.app.servlet;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Qna;
import org.yun.app.util.StringUtil;

@WebServlet("/contact-post.html")
public class ContactServlet extends CommonServlet{

	/**
	 * 在线留言
	 */
	private static final long serialVersionUID = 7210474434730215250L;
	
	public ContactServlet(){
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Qna temp = new Qna();
		temp.setUserName(req.getParameter("userName"));
		temp.setUserEmail(req.getParameter("userEmail"));
		temp.setUserTel(req.getParameter("userPhone"));
		temp.setQuestion(req.getParameter("userMsg"));
		temp.setAnswer("云商正在撰写答案，请耐心等待...");
		temp.setQuestioner(0);
		temp.setResponder(0);
		String path = this.getServletContext().getRealPath("/WEB-INF/dirtywords.properties");
		Properties p = new Properties();
		p.load(new FileReader(path));
		temp.setQuestion(StringUtil.replaceDirtyWords(temp.getQuestion(), p));
		Object[] params = new Object[]{temp.getUserName(),temp.getUserEmail(),temp.getUserTel(),temp.getQuestion(),temp.getAnswer(),temp.getQuestioner(),temp.getResponder()};
		
		
		int row = new CommonDAOImpl().updateDataBase("INSERT INTO tb_qna (userName,userEmail,userTel,question,answer,questioner,responder) VALUES (?,?,?,?,?,?,?) ", params);
		if(row!=0){
			resp.sendRedirect("delivery.html");
		}else{
			req.getRequestDispatcher("/WEB-INF/webPage/about.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
