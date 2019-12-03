package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;
import product.Producthandler;



@SuppressWarnings("serial")

@WebServlet(urlPatterns = "/AddProductToDB")

public class AddProductToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException, 
	ServletException{
		
		Producthandler ph=new Producthandler();
		Product p=new Product(
				req.getParameter("ProductName"), 
				req.getParameter("ProductDescription"), 
				Double.parseDouble(req.getParameter("ProductPrice")), 
				Short.parseShort(req.getParameter("ProductStockQty")),
				Short.parseShort(req.getParameter("productCategoryId")),
				Integer.parseInt(req.getParameter("productImageId"))
				
				);
				ph.insert(p);
				resp.sendRedirect("viewProduct.jsp");
				
		
		
	}
	
	

}
