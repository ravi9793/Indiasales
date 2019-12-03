package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.Userhandler;
@WebServlet(urlPatterns ="/checklogin")

public class checklogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Userhandler uh = new Userhandler();
		
		User u = uh.checkLogin(email, password);
		
		if( u == null ) {
			req.setAttribute("invalid", "invalid");
			req.getRequestDispatcher("UserLogIn.jsp").forward(req, resp);			
		}
		
		else {
			
			req.getSession().setAttribute("currentUser", u);
			
			resp.sendRedirect("viewProduct.jsp");
			
		}
	}	
}