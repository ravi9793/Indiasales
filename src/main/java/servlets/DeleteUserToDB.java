package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.Userhandler;

@SuppressWarnings("serial")

@WebServlet(urlPatterns ="/DeleteUserToDB")
public class DeleteUserToDB extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		Userhandler uh=new Userhandler();
		uh.deleteById(id);
		resp.sendRedirect("viewUser.jsp");
		
	}
	
	

}
