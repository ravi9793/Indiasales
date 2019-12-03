package imagebank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;

interface ImageBankStandard{
	void insert(ImageBank ib);
	List<ImageBank> fetchAllImagesInBank();
	String deleteById(int id);
	
}


public class ImageBankhandler implements ImageBankStandard{

	
	public String deleteById(int id) {
		try {

			String query = "delete from imagebank where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}
		
		return "Image Bank Deletion Successful";
	}

	public void insert(ImageBank ib) {
		try {

			String query = "insert into imagebank " + "(url) " + 
			"values " + "(?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, ib.getUrl());
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public List<ImageBank> fetchAllImagesInBank() {
		List<ImageBank> list = new ArrayList<ImageBank>();

		try {

			String query = "select * from imagebank";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				list.add(new ImageBank(rs.getInt("id"), rs.getString("url")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
