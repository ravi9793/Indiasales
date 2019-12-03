package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.carthandler;


@WebServlet(urlPatterns = "/DeleteCart")
public class DeleteCart extends HttpServlet{
	
	@Override
	protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{

		int id = Integer.parseInt(req.getParameter("id"));
		
		carthandler ch = new carthandler();
		
		ch.deleteById(id);

		resp.sendRedirect("ViewCart.jsp");
	}
}



