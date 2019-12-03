package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Producthandler;
@SuppressWarnings("serial")

@WebServlet(urlPatterns = "/DeleteProductfromDB")
public class DeleleProductfromDB extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException,
	ServletException{
		// TODO Auto-generated method stub
		
		
	  int id=Integer.parseInt(req.getParameter("id"));
	  
	  Producthandler ph=new Producthandler();
	  ph.deleteById(id);
	  
	  
		resp.sendRedirect("viewProduct.jsp");
	}

	
}