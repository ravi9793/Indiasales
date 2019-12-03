package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import category.Category;
import config.Configuration;
import user.User;

interface UserStandard {
	String insert(User r);

	List<User> fetchAllUsers();

	boolean deleteById(int id);

	String update(User u);

	User fetchUser(int id);

	User checkLogin(String email, String password);
}

public class Userhandler implements UserStandard {

	public User checkLogin(String email, String password) {
		try {

			Connection conn = Configuration.conn;

			String query = "SELECT * FROM USER WHERE EMAIL =? AND PASSWORD = ? and ACTIVE = 1";

			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				User u = new User();

				u.setEmail(rs.getString("EMAIL"));
				u.setRole(rs.getString("ROLE"));
				u.setId(rs.getInt("ID"));
				
				return u;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public String insert(User r) {
		try {
			String query = "insert into user(name,phone,email,password) values(?,?,?,?)";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, r.getName());
			p.setString(2, r.getPhone());
			p.setString(3, r.getEmail());
			p.setString(4, r.getPassword());

			// System.out.println("-----------name-----"+r.getName());
			// System.out.println("-----------description-----"+pr.getDescription());
			p.executeUpdate();
		} catch (Exception e) {
			return e.getMessage();

		}
		return "User Inserted Successfully";
	}

	public List<User> fetchAllUsers() {
		List<User> list = new ArrayList<User>();

		try {

			String query = "select * from user";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				list.add(new User(rs.getInt("id"), rs.getString("name"), rs.getString("phone"), rs.getString("email"),
						rs.getString("password"), rs.getShort("active"), rs.getString("role")

				));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean deleteById(int id) {
		try {

			String query = "delete from user where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setInt(1, id);
			p.executeUpdate();

			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	public User fetchUser(int id) {
		try {

			String query = "Select * from user where id=?";

			Connection conn = Configuration.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				return new User(rs.getInt("id"), rs.getString("name"), rs.getString("phone"), rs.getString("email"),
						rs.getString("password"));
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new User();
	}

	public String update(User u) {
		try {

			System.out.println(u);

			String query = "update user set name=?,phone=?,email=?,password=?,active=? where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, u.getName());
			p.setString(2, u.getPhone());
			p.setString(3, u.getEmail());
			p.setString(4, u.getPassword());
			p.setShort(5, u.getActive());
			p.setInt(6, u.getId());

			p.executeUpdate();

			// System.out.println("-----------name-----"+c.getName());
			// System.out.println("-----------description-----"+c.getDescription());
		} catch (Exception ex) {
			System.out.println(ex);
			return ex.getMessage();
		}

		return "user Update Successfully ";
	}
}
