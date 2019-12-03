package servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.Cart;
import cart.carthandler;
import product.Product;
import product.Producthandler;



@WebServlet(urlPatterns ="/AddCartToDB")

public class AddCartToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int productId=Integer.parseInt(req.getParameter("productId"));
		int userId=Integer.parseInt(req.getParameter("userId"));
		
		Producthandler ph=new Producthandler();
		
		Product p=ph.fetchProduct(Integer.parseInt(req.getParameter("productId")));
		
		int currStock=p.getStockqty();
		 int requestedStock=Integer.parseInt(req.getParameter("qty"));
		 
		 carthandler ch=new carthandler();
		
		 Cart ct=new Cart(productId,userId,requestedStock);
		 
		 if(currStock < requestedStock)
		 {
			 resp.sendRedirect("NotEnoughStock.jsp");
		 }
		 
		 
		 
		 else if(ch.checkCartIn(userId,productId))
		 {
			 resp.sendRedirect("AllreadyInCart.jsp");
		 }
		 else
		 {
			 Cart c=new Cart(productId,userId,requestedStock);
			 
			 p.setStockqty((short) (currStock - requestedStock));
			 
			 
			 
			 ph.update(p);
			 System.out.println(ch.insert(ct));
			 System.out.println(ct);
			 resp.sendRedirect("ViewCart.jsp");
		 }
	
	}
			
}

