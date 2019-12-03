package category;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import config.Configuration;

interface CategoryStandard {
	String insert(Category c);

	boolean deleteById(short id);

	String update(Category c);

	Category fetchCategory(short id);

	List<Category> fetchAllCategories();
} 

public class Categoryhandler implements CategoryStandard {
	public String insert(Category c) {
		try {
			String query = "insert into category (name, description) values (?,?)";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, c.getName());
			p.setString(2, c.getDescription());
			// System.out.println("-----------name-----"+c.getName());
			// System.out.println("-----------description-----"+c.getDescription());
			p.executeUpdate();
		} catch (Exception e) {
			return e.getMessage();

		}
		return "Category Inserted Successfully";

	}

	public List<Category> fetchAllCategories() {
		List<Category> list = new ArrayList<Category>();
		try {
			String query = "Select * from category";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				list.add(new Category(rs.getShort("id"), rs.getString("name"), rs.getString("description")));
			}

		}

		catch (Exception e) {
			e.printStackTrace();

		}
		return list;

	}

	public boolean deleteById(short id) {
		// TODO Auto-generated method stub

		try {

			String query = "delete from category where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setShort(1, id);
			p.executeUpdate();

			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;

	}

	public Category fetchCategory(short id) {

		try {

			String query = "Select * from category where id=?";

			Connection conn = Configuration.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setShort(1, id);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				return new Category(rs.getShort("id"), rs.getString("name"), rs.getString("description"));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new Category();

	}

	public String update(Category c) {
		// TODO Auto-generated method stub
		
		try {
			
			System.out.println(c);
			
			String  query="update category  set name=?,description=? where id=?";
			
			Connection conn=Configuration.conn;
			PreparedStatement p=conn.prepareStatement(query);
			 p.setString(1, c.getName());
			 p.setString(2, c.getDescription());
			 p.setShort(3, c.getId());
			 
			 p.executeUpdate();
			 
			 //System.out.println("-----------name-----"+c.getName());
			// System.out.println("-----------description-----"+c.getDescription());
		}
		catch(Exception ex)
		{
			System.out.println(ex);
			return ex.getMessage();
		}
		
		return "Category Update Successfully ";
	}

	
}
