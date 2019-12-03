package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import category.Categoryhandler;
@SuppressWarnings("serial")

@WebServlet(urlPatterns = "/deleteCategoryfromDB")
public class deleteCategoryfromDB extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException,
	ServletException{
		// TODO Auto-generated method stub
		
		
	  short id=Short.parseShort(req.getParameter("id"));
	  
	  Categoryhandler ch=new Categoryhandler();
	  
	  ch.deleteById(id);
		resp.sendRedirect("viewCategory.jsp");
	}

	
}
