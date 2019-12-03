package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import  user.Userhandler;

@SuppressWarnings("serial")
@WebServlet(urlPatterns ="/AddUserToDB")
public class AddUserToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Userhandler uh=new Userhandler();
		User u=new User(
				 req.getParameter("UserName"),
				 req.getParameter("Phone"),
				 req.getParameter("email"),
				 req.getParameter("password"));
				
		
			uh.insert(u);
				resp.sendRedirect("NewAccount.jsp");
				
	}
	
	

}
