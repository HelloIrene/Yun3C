package org.yun.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月12日
* Time: 下午7:28:57
*/
@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 2097152,maxFileSize= 10485760)
public class UploadServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 649161505994615633L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String fileDesc =req.getParameter("fileDesc");
		if(fileDesc==null){
			req.getRequestDispatcher("/WEB-INF/page/upload.jsp").forward(req, resp);
		}
		else{
			Part part =req.getPart("file");
			req.setAttribute("fileDesc", fileDesc);
			req.setAttribute("fileSize", part.getSize());
			req.setAttribute("contentType", part.getContentType());
			
			String partFileName=getPartFileName(part);
			UUID uuid = UUID.randomUUID();
			String newFileName =null;
			int idx =partFileName.lastIndexOf(".");
			if(idx!=-1){
				newFileName =uuid.toString()+partFileName.substring(idx);
			}else{
				newFileName = uuid.toString();
			}
			part.write(getServletContext().getRealPath("/upload")+"/"+newFileName);
			PrintWriter pw = resp.getWriter();
			pw.print("upload/"+newFileName);
		}
	}

	private String getPartFileName(Part part) {
		String headerValue = part.getHeader("content-disposition");
		int index = headerValue.lastIndexOf("filename");
		String fileName =null;
		if(index!=-1){
			fileName = headerValue.substring("filename=".length()+index);
			fileName = fileName.substring(0,fileName.length()-1);
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		}
		return fileName;
	}

}
