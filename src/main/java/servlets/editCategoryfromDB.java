package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import category.Category;
import category.Categoryhandler;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/editCategoryfromDB")
public class editCategoryfromDB extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		  short id=Short.parseShort(req.getParameter("id"));
		  
		  String name=req.getParameter("categoryName");
		  String description=req.getParameter("categoryDescription");
		  
		  Category c=new Category(id, name, description);
		  
		  Categoryhandler ch=new Categoryhandler();
		  System.out.println(ch.update(c));
		  
		  
			resp.sendRedirect("viewCategory.jsp");
		
		
	}

	
}
