package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Address.addesshandler;
import Address.address;

@WebServlet(urlPatterns ="/AddressToDB")
public class AddressToDB extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		addesshandler ah=new addesshandler();
		address a=new address(
				req.getParameter("address"),
				Integer.parseInt(req.getParameter("pincode")));
				
			ah.insert(a);
				resp.sendRedirect("CartDetails.jsp");
	
		
	}
}
	
	


