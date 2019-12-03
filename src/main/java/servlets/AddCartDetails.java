package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cartdetails.CartDetails;
import cartdetails.CartDetailshandler;

@WebServlet(urlPatterns ="/AddCartDetails")

public class AddCartDetails extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CartDetailshandler cdh=new CartDetailshandler();
		CartDetails cd=new CartDetails(
				req.getParameter("cartnumber"),
				req.getParameter("expdate"),
				Integer.parseInt(req.getParameter("cvv"))
				
				);
		cdh.insert(cd);
		resp.sendRedirect("ThankYou.jsp");
		
	}
	
	

}
