package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imagebank.ImageBankhandler;

@WebServlet(urlPatterns ="/DeleteImageBank")

@SuppressWarnings("serial")
public class DeleteImageBank extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        int id = Integer.parseInt(req.getParameter("id"));
		
		ImageBankhandler ibh = new ImageBankhandler();
		String msg = ibh.deleteById(id);
		
		if( msg.startsWith("Cannot delete or update a parent row: a foreign key constraint fails") ) {
			msg = "Cannot Delete: Products refer to image";
		}
		
		req.setAttribute("msg", msg);
		
		req.getRequestDispatcher("ViewImageBank.jsp").forward(req, resp);
	}
	
	

}
