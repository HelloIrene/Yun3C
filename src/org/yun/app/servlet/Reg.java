package org.yun.app.servlet;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletConfig;  
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class Reg extends CommonServlet {  
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletConfig Servletconf;   
    private String username;  
    private String email;  
    private String msg; 
    public void init(ServletConfig config) throws ServletException {  
        super.init(config);  
        this.Servletconf=config;  
    } 
    
    public Reg() {
    	super();
		// TODO Auto-generated constructor stub
	}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	request.setCharacterEncoding("GBK");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "no-cache"); // 禁用缓存
		response.setContentType("application/json;charset=utf-8"); // 设置输出响应的类型为json
        request.setCharacterEncoding("utf-8");
        PrintWriter pw = response.getWriter();
        username=request.getParameter("name");  
        email=request.getParameter("email");
//        pw.println(username+email);
        int num=(int)((Math.random()*9+1)*100000);
        /* 
         * …… 
         *  
         * 省略注册并写入数据库部分 
         * …… 
         *  
         */  
        
        /* 
         *  
         * 注册成功，发送欢迎邮件  
         *  
         */  
        if(sendmail(email,username,num))  
        {  
            msg="邮件发送成功"; 
        }  
        else  
        {  
            msg="邮件发送失败";  
              
        }  
        pw.print(new Gson().toJson(num)); 
    }
    
    /** 
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
     */  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
      
    private boolean sendmail(String mailto,String username,int num){  
        String MailTo=mailto;  
        String MailSubject="行者。孙 - Application Received";  
        String MailBCopyTo="";  
        String MailCopyTo="";  
        String MailBody="<p><img alt=\"slx\" src=\"http://101.132.68.208/imgs/xia.png\" border=\"0\" /></p>"  
        +"<p>亲爱的 "+username+"<br /></p>" +  
                "   <div>你已成功注册<br>" +  
                "   验证码为："+num+"</div><br />" +  
                "   <div margin-right:50px> 孙 </div>";  
        String SMTPHost = Servletconf.getInitParameter("smtphost");  
        String Port=Servletconf.getInitParameter("port");  
        String MailUsername = Servletconf.getInitParameter("mailusername");  
        String MailPassword = Servletconf.getInitParameter("mailpassword");  
        String MailFrom = Servletconf.getInitParameter("mailfrom");  
        if(SMTPHost==null||SMTPHost==""||MailUsername==null||MailUsername==""||MailPassword==null||MailPassword==""||MailFrom==null||MailFrom=="")  
        {  
        }  
        SendMail send=new SendMail(SMTPHost,Port,MailUsername,MailPassword);  
        if(send.sendingMimeMail(MailFrom, MailTo, MailCopyTo, MailBCopyTo, MailSubject, MailBody)){  
            return true;  
        }  
        else  
        {  
            return false;  
        }  
    }  
//    private void toResponse(HttpServletResponse response,String toString) throws IOException  
//    {  
//        response.setCharacterEncoding("gb2312");  
//        PrintWriter out=response.getWriter();  
//        out.println(toString);  
//    }  
  
}  