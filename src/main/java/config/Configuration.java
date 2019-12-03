package config;


import java.sql.*;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
//import category.Category;
//import category.CategoryHandler;

//import category.Category;
//import category.CategoryHandler;


public class Configuration implements ServletContextListener {
	
	public static final Connection conn=getConnection();

	private static Connection getConnection() {
		// TODO Auto-generated method stub
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("DB CONNECTED");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "password");
				
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("DB CONNECTION FAILURE");
		}
		return null;
		
	}
	
	public void contextDestroyed(ServletContextEvent sce)
	{
		try
		{
			conn.close();
			System.out.println("DB DISCONNECTED");
		}catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("DB CONNECTED FAILURE");
		}
	}

	
	
	public void contextInitialized(ServletContextEvent sce)
	{
	/*Category c=new Category("a","a");
		CategoryHandler ch=new CategoryHandler();
	System.out.println(ch.insert(c));
	}
*/
}
}