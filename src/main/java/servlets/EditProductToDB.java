package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import product.Product;
import product.Producthandler;


@WebServlet(urlPatterns = "/EditProductToDB")
public class EditProductToDB extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  int id=Integer.parseInt(req.getParameter("id")); 
		  String name=req.getParameter("productName"); 
		  String description=req.getParameter("productDescription"); 
		  double price = Double.parseDouble(req.getParameter("productPrice")); 
		  short stockqty = Short.parseShort(req.getParameter("productStockqty")); 
		  short categoryId = Short.parseShort(req.getParameter("productCategoryId"));

		  
		  
		  Product pr = new Product(id,name,description,price,stockqty,categoryId);
		  Producthandler prh = new Producthandler();
		  
		  System.out.println(prh.update(pr));
		 
		
		resp.sendRedirect("viewProduct.jsp");
		
	}
	
	

}
