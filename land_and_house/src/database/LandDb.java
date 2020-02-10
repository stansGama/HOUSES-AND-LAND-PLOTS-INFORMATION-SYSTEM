package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import business.Land;

public class LandDb extends PropertyDb{
	private static String url = "jdbc:mysql://localhost/house_and_land";
	private static String username = "root";
	private static String pass = "@Wasternie96";
	
	
	public static void main(String [] arg) {
		/*Land land = getLand("20190624_21234437");
		land.setCity("Moro");
		land.setDistrict("Moro");
		land.setWard("Moro");
		land.setStreet("Moro");
		land.setCountry("Moro");
		if(insertLocation(land)==1) {
			System.out.println("Done");
		}*/
	}
	
	public static  Land getLand(String id) {
		Land land = new Land();
		try {
			String query = "SELECT * FROM land WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, id);
			land.setProperty_id(id);
			ResultSet result = stmt.executeQuery();
			while(result.next()) {
				land.setLand_id(result.getString("land_id"));
				land.setLand_type(result.getString("land_type"));
				land.setFeatures(result.getString("other_features"));
			}
			connect.close();
			
		}catch(SQLException e) {
			
		}
		return land;
	}
	
	public static ArrayList<Land> getLands(){
		ArrayList<Land> lands = new ArrayList<>();
		try {
			String query ="SELECT * FROM land";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt =  connect.prepareStatement(query);
			ResultSet result = stmt.executeQuery();
			while(result.next()) {
				Land land = new Land();
				land.setLand_id(result.getString("land_id"));
				land.setLand_type(result.getString("land_type"));
				land.setFeatures(result.getString("other_features"));
				lands.add(land);
			}
			connect.close();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return lands;
	}
	public static int updateLand(Land land) {
		int result = 0;
		try {
			String query = "UPDATE land SET land_type=?, other_features=? WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(3, land.getProperty_id());
			stmt.setString(2, land.getFeatures());
			stmt.setString(1, land.getLand_type());
			result = stmt.executeUpdate();
			System.out.println(stmt);
		}catch(SQLException e) {
			System.out.println(e.getMessage());
			
		}
		return result;
	}
	
	public static int insertLand(Land land) {
		int result = 0;
		if(getProperty(land.getProperty_id()).getProperty_id().equals("")) {
			result = insertProperty(land);
			if(result == 1) {
				try {
					String query = "INSERT INTO land (land_id, land_type, other_features, property_id) VALUES(?,?,?,?)";
					Connection connect = DriverManager.getConnection(url, username, pass);
					PreparedStatement stmt = connect.prepareStatement(query);
					stmt.setString(4, land.getProperty_id());
					stmt.setString(3, land.getFeatures());
					stmt.setString(2, land.getLand_type());
					stmt.setString(1, land.getLand_id());
					result = stmt.executeUpdate();	
					connect.close();
					
				}catch(SQLException e) {
					
				}
			}
		}
		
		return result;
	}
}
