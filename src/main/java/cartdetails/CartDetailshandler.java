package cartdetails;

import java.sql.Connection;
import java.sql.PreparedStatement;


import config.Configuration;

interface CartDetailsStandard
	{
		String insert(CartDetails cd);
	}

public class CartDetailshandler implements CartDetailsStandard{

	public String insert(CartDetails cd) {
		
		
		
			try {
				
				String query = "insert into cartdetails (number,expdate,cvv) values (?,?,?)";
				Connection conn = Configuration.conn;
				PreparedStatement p = conn.prepareStatement(query);
				
				p.setString(1, cd.getCartnumber());
				p.setString(2, cd.getExpyear());
				p.setInt(3,cd.getCvv());
				
				// System.out.println("-----------name-----"+a.getAddress());
				// System.out.println("-----------description-----"+a.getPin_code());
				p.executeUpdate();
			} catch (Exception e) {
				return e.getMessage();

			}
			return "Address Inserted Successfully";
}
}
