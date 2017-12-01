package org.yun.app.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.User;


@WebServlet("/Altermessage")
@MultipartConfig
public class UploadMessageServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	/**
	 * �����ϴ��ļ���ajax
	 * �ļ�Ĭ�ϴ洢��tomcat�¶�Ӧjava web��Ŀ�µ�upload�ļ���
	 * �����ļ���
	 */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	
	@SuppressWarnings("null")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommonDAOImpl dao = new CommonDAOImpl();
		List<Object> peoples= new ArrayList<Object>();
		Part part =req.getPart("file");
		String name =req.getParameter("name");
		String email =req.getParameter("email");
		String telephone =req.getParameter("telephone");
		String image =req.getParameter("image");
		String partFileName = part.getHeader("content-disposition");
		int row=0;
		peoples = dao.findByCondition(User.class,"SELECT * FROM tb_user WHERE loginname=?",name);
		if(peoples.size()>0){
			User user=(User)peoples.get(0);
			if(email!=null && email.length()>0 && !email.equals(user.getEmail())){
				row=dao.updateDataBase("UPDATE tb_user SET email=? WHERE loginname=?",email,name);
			}
			if(telephone!=null && telephone.length()>0 && !telephone.equals(user.getTelephone())){
				row=dao.updateDataBase("UPDATE tb_user SET telephone=? WHERE loginname=?",telephone,name);
			}
			String newFileName =null;
			int idx =partFileName.lastIndexOf(".");
			UUID uuid=UUID.randomUUID();
			if(idx!=-1){
				newFileName =uuid.toString()+name+partFileName.substring(idx,partFileName.length()-1);
			}else{
				newFileName =uuid.toString()+name;
			}
			InputStream in = part.getInputStream();
			String path = getServletContext().getRealPath("images")+"\\"+newFileName;
			String path1 ="E:\\image\\"+newFileName;
		    OutputStream out = new FileOutputStream(new File(path));
		    OutputStream out1 = new FileOutputStream(new File(path1));
	        byte[] buffer = new byte[1024];
	        int length = -1;
	        while ((length = in.read(buffer)) != -1) {
	            out.write(buffer, 0, length);
	            out1.write(buffer, 0, length);
	        }
	        in.close();
	        out.close();
	        out1.close();
			if(image!=null){
				row=dao.updateDataBase("UPDATE tb_user SET image=? WHERE loginname=?","/shopping/upload/"+newFileName,name);
			}
			List<Object> newmessage = dao.findByCondition(User.class,"SELECT * FROM tb_user WHERE loginname=?",name);
			User user1=(User)newmessage.get(0);
			HttpSession session = req.getSession();
			session.setAttribute("user", user1);
			part.write(getServletContext().getRealPath("/upload")+"/"+newFileName);
		}
		resp.getWriter().print(row);
	}

}
