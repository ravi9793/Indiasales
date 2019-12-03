package Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Address.address;
import category.Category;
import config.Configuration;
import product.Product;
import user.User;


interface addressStandard
		{
	
			String insert(address a);
			List<address> fetchAllAddress();
			
		}

public class addesshandler implements addressStandard{

	public String insert(address a) {
		try {
			String query = "insert into address (address,pin_code) values (?,?)";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			
			p.setString(1, a.getAddress());
			
			p.setInt(2, a.getPin_code());
			// System.out.println("-----------name-----"+a.getAddress());
			// System.out.println("-----------description-----"+a.getPin_code());
			p.executeUpdate();
		} catch (Exception e) {
			return e.getMessage();

		}
		return "Address Inserted Successfully";

}

	public List<address> fetchAllAddress() {
		
		List<address> list = new ArrayList<address>();

		try {

			String query = "Select a.*,u.name as Username, u.phone as Userphone, p.description as pdescription from user u,address a, product p where a.id=u.id  ";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();
/*
			while (rs.next()) {

				list.add(new address(rs.getInt("id"), 
						rs.getString("address"), 
						rs.getInt("pincode"),
						
						

						new User(rs.getString("Username"),

									  rs.getString("Userphone"))));
			}
			*/

		} catch (Exception e) {
			e.printStackTrace();
		}


		return list;
		
	
	
		}
		
	}

		
	

