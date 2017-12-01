package org.yun.app.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.yun.app.dao.CommonDAOImpl;

import org.yun.app.entity.Backproduct;
import org.yun.app.entity.Product;
import org.yun.app.servlet.CommonServlet;

import com.google.gson.Gson;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/dashboard/backproduct.html")
public class BackproductServlet extends CommonServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8"); 
		response.setCharacterEncoding("utf-8");	
		int id;
		if(request.getParameter("productId").equals("")) {id=0;}
		else	
	    {id = Integer.valueOf(request.getParameter("productId")).intValue();}		
		String name =request.getParameter("productname");
		String type = request.getParameter("producttype");
//		String color =request.getParameter("productcolor");
//		String model =request.getParameter("model");
		Double price;
		if((request.getParameter("productprice")).equals("")) {price=0.0;}
		else{
			price = Double.parseDouble(request.getParameter("productprice"));		
		}
		String img ="images/"+request.getParameter("file_upload");
		String img2;
		
		String description =request.getParameter("description");	
		int sales;
		if(request.getParameter("sales").equals("")) {sales=0;}
		else
	    {sales = Integer.valueOf(request.getParameter("sales")).intValue();}	
		Timestamp ts = new Timestamp(System.currentTimeMillis());
//		int num;
//		if(request.getParameter("num").equals("")) {num=0;}
//		else
//	    {num = Integer.valueOf(request.getParameter("num")).intValue();}
		String specification =request.getParameter("specification");
		
		String submit =request.getParameter("submit");
		
		if(submit.equals("查询")){
			
			List<Object> sel = new CommonDAOImpl().findByCondition(Product.class, "SELECT * FROM tb_product WHERE productID=?",
					id);
			if(sel.size()>0){
			Product p1 = (Product) sel.get(0);			
			request.setAttribute("product", p1);
			request.getRequestDispatcher("/WEB-INF/webPage/backpreview.jsp").forward(request, response);
//			response.sendRedirect("backpreview.html");
			}
			else{
				img="images/boom.jpg";
				Product p1 = new Product();
				p1.setProductID(id);
				p1.setImgPath(img);
				request.setAttribute("product", p1);
				request.getRequestDispatcher("/WEB-INF/webPage/backpreview.jsp").forward(request, response);
			}
		}
		
		if(submit.equals("添加")){
		//当数据库中有这个商品时 拿出它的库存
		List<Object> search = new CommonDAOImpl().findByCondition(Product.class, "SELECT * FROM tb_product WHERE productID=?",
				 id );
		if (search.size() > 0) {
			Product p1 = (Product) search.get(0);
			img2=p1.getImgPath();
			
			if(img.length()<img2.length()){
		//更新它的库存 ==原库存加上先要插入的数量	
				
				int up = new CommonDAOImpl().updateDataBase("UPDATE tb_product set price=?,stock=?,imgPath=?,addTime=?,sales=? where productID=?",
						price,p1.getStock()+sales,img2,ts,sales,id);
				List<Object> search2 = new CommonDAOImpl().findByCondition(Product.class, "SELECT * FROM tb_product WHERE productID=?",
						 id );
				//传现有库存
				Product p2 = (Product) search2.get(0);					
				request.setAttribute("Product", p2);
				PrintWriter out=response.getWriter();
				out.print("<script language='javascript'>alert('添加成功');window.location.href='/shopping/dashboard/backpreview.html';</script>");
//				request.getRequestDispatcher("/WEB-INF/webPage/backpreview.jsp").forward(request, response);
			}
		} else{
		//当数据库没有这个商品 插入它的所有信息	
//			    int flag=0;
			    img="images/"+request.getParameter("file_upload");
				int ol = new CommonDAOImpl().updateDataBase("INSERT INTO tb_product (productID,productName,price,description,stock,imgPath,addTime,sales,productType) value(?,?,?,?,?,?,?,?,?)",
						id,name,price,description,sales,img,ts,sales,type);
				
					if (ol!=0) {	
//						List<Object> searchol = new CommonDAOImpl().findByCondition(Product.class, "SELECT * FROM tb_backstage WHERE productID=?",
//								 id );
//						Product p3 = (Product) searchol.get(0);
//						if(p3.getProductID()==0||p3.getProductName().equals("")||p3.getPrice().equals("")
//								||p3.getDescription().equals("")||p3.getProductType().equals(""))
//							flag=1;
//						if(flag==1) {
//							response.sendRedirect("404.html");							
//							int del = new CommonDAOImpl().updateDataBase("DELETE from tb_product where productID=?",
//									id);
//						}
						PrintWriter out=response.getWriter();
						out.print("<script language='javascript'>alert('添加成功');window.location.href='/shopping/dashboard/backproduct-hot.html';</script>");
//						 request.getRequestDispatcher("/WEB-INF/webPage/backpreview.jsp").forward(request, response);
									
					} 
					else {
						PrintWriter out=response.getWriter();
						out.print("<script language='javascript'>alert('添加失败');window.location.href='/shopping/dashboard/backpreview.html';</script>");
//						response.sendRedirect("404.html");
						 }
	}				
		}
		
		
		if(submit.equals("更新")){
			int update;
			List<Object> sel = new CommonDAOImpl().findByCondition(Product.class, "SELECT imgPath FROM tb_product WHERE productID=?",id);
			Product p2 = (Product) sel.get(0);
			img2=p2.getImgPath();			
			if(img.length()>img2.length()){
				update = new CommonDAOImpl().updateDataBase("UPDATE tb_product set productID=?,productName=?,price=?,description=?,imgPath=?,addTime=?,productType=? where productID=?",
						id,name,price,description,img,ts,type,id);			
			}
			else{
				update = new CommonDAOImpl().updateDataBase("UPDATE tb_product set productID=?,productName=?,price=?,description=?,imgPath=?,addTime=?,productType=? where productID=?",
						id,name,price,description,img2,ts,type,id);				
			}	
			List<Object> search2 = new CommonDAOImpl().findByCondition(Product.class, "SELECT * FROM tb_product WHERE productID=?",
					 id );	
			Product p3 = (Product) search2.get(0);				
			request.setAttribute("product", p3);
			if (update>0) {		
				PrintWriter out=response.getWriter();
				out.print("<script language='javascript'>alert('更新成功');window.location.href='/shopping/dashboard/backpreview.html';</script>");
//				request.getRequestDispatcher("/WEB-INF/webPage/backpreview.jsp").forward(request, response);
				} 
				else {
					PrintWriter out=response.getWriter();
					out.print("<script language='javascript'>alert('更新成功');window.location.href='/shopping/dashboard/backpreview.html';</script>");
//					response.sendRedirect("404.html");
					 }
		}
		
		if(submit.equals("删除")){
			//删除商品
			List<Object> sel = new CommonDAOImpl().findByCondition(Product.class, "SELECT imgPath FROM tb_product WHERE productID=?",
			 id );
			Product p2 = (Product) sel.get(0);
			img=p2.getImgPath();
			int del = new CommonDAOImpl().updateDataBase("DELETE from tb_product where productID=?",
					id);
			//将删除的商品插入商品删除表中
			int into = new CommonDAOImpl().updateDataBase("INSERT INTO tb_delbackstage (productID,productName,price,description,stock,imgPath,addTime,sales,productType) value(?,?,?,?,?,?,?,?,?)",
					id,name,price,description,sales,img,ts,sales,type);
			if (del!=0) {	
				PrintWriter out=response.getWriter();
				out.print("<script language='javascript'>alert('删除成功');window.location.href='/shopping/dashboard/backpreview.html';</script>");
//				request.getRequestDispatcher("/WEB-INF/webPage/backpreview.jsp").forward(request, response);
			}	
			else {
				PrintWriter out=response.getWriter();
				out.print("<script language='javascript'>alert('删除失败');window.location.href='/shopping/dashboard/backpreview.html';</script>");
//				response.sendRedirect("404.html");
				 }
		}		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
