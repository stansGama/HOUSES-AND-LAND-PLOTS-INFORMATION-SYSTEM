package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.TreeMap;

import business.Property;
import business.User;

public class PropertyDb {
	private static String url = "jdbc:mysql://localhost/house_and_land";
	private static String username = "root";
	private static String pass = "@Wasternie96";

	/*
	 * public static void main(String [] arg) { ArrayList<Property> users =
	 * getProperties(); System.out.println("Hello"); for(Property usr: users) {
	 * System.out.print(usr.getProperty_id()); System.out.print(usr.getOwner());
	 * System.out.println(usr.getCountry()); Set<Map.Entry<Integer, String[]>> mm =
	 * usr.getPictures().entrySet(); for(Map.Entry<Integer, String[]> ff:mm) {
	 * System.out.println("Pic id:"+ff.getKey()); System.out.println("Pic name:"+
	 * ff.getValue()[0]); System.out.println("Pic desc:"+ ff.getValue()[1]); } } }
	 */

	public static Property getProperty(String id) {
		Property property = new Property();
		try {
			String query = "SELECT * FROM property WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, id);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				property.setProperty_id(result.getString("property_id"));
				property.setOwner(result.getString("owner"));
				property.setPrice(result.getString("price"));
				property.setType(result.getString("type"));
				property.setSize(result.getString("size"));
				getLocation(property, connect);
				getPictures(property, connect);
				property.setComments(CommentDb.getComment(property, connect));
			}
			connect.close();
		} catch (SQLException e) {

		}
		return property;
	}

	public static ArrayList<Property> getProperties() {
		ArrayList<Property> properties = new ArrayList<>();
		try {
			String query = "SELECT * FROM property";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				Property property = new Property();
				property.setProperty_id(result.getString("property_id"));
				property.setOwner(result.getString("owner"));
				property.setPrice(result.getString("price"));
				property.setType(result.getString("type"));
				property.setSize(result.getString("size"));
				getLocation(property, connect);
				getPictures(property, connect);
				property.setComments(CommentDb.getComment(property, connect));
				properties.add(property);
			}
			connect.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return properties;
	}

	public static ArrayList<Property> getUserProperties(User user) {
		ArrayList<Property> properties = new ArrayList<>();
		try {
			String query = "SELECT * FROM property WHERE owner = ? ";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, user.getEmail());
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				Property property = new Property();
				property.setProperty_id(result.getString("property_id"));
				property.setOwner(result.getString("owner"));
				property.setPrice(result.getString("price"));
				property.setType(result.getString("type"));
				property.setSize(result.getString("size"));
				getLocation(property, connect);
				getPictures(property, connect);
				property.setComments(CommentDb.getComment(property, connect));
				properties.add(property);
			}
			connect.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return properties;
	}

	// private method to query location and store it in the property object
	private static void getLocation(Property property, Connection connect) {
		try {
			String query = "SELECT * FROM property_location where property_id = ?";
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				property.setCountry(result.getString("country"));
				property.setCity(result.getString("city"));
				property.setDistrict(result.getString("district"));
				property.setWard(result.getString("ward"));
				property.setStreet(result.getString("street"));
			}
		} catch (SQLException e) {

		}
	}

	// private method to query pictures and store it in the property object
	private static void getPictures(Property property, Connection connect) {
		TreeMap<Integer, String[]> pictures = new TreeMap<Integer, String[]>();
		try {
			String query = "SELECT * FROM property_photos WHERE property_id=?";
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			ResultSet result = stmt.executeQuery();
			int i = 1;
			while (result.next()) {
				pictures.put(i, new String[] { result.getString("photo_name"), result.getString("description") });
				property.setPictures(pictures);
				i++;
			}

		} catch (SQLException e) {

		}
	}

	public static ArrayList<String[]> getTypes() {
		ArrayList<String[]> types = new ArrayList<>();
		try {
			String query = "SELECT * FROM property_type";
			Connection connect = DriverManager.getConnection(url, username, pass);
			Statement stmt = connect.createStatement();
			ResultSet result = stmt.executeQuery(query);
			while (result.next()) {
				types.add(new String[] { result.getString("type_id"), result.getString("type") });
			}
		} catch (SQLException e) {

		}

		return types;
	}

	public static int insertProperty(Property property) {
		int result = 0;
		try {
			String query = "INSERT INTO property (property_id, owner, type, price, size) VALUES (?,?,?,?,?)";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			stmt.setString(2, property.getOwner());
			stmt.setInt(3, Integer.parseInt(property.getType()));
			stmt.setString(4, property.getPrice());
			stmt.setString(5, property.getSize());
			result = stmt.executeUpdate();
			connect.close();

		} catch (SQLException e) {

		}
		return result;
	}

	public static int insertLocation(Property property) {
		int result = 0;
		try {
			String query = "INSERT INTO property_location(property_id, country, city, district, ward, street) VALUES(?,?,?,?,?,?)";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			stmt.setString(2, property.getCountry());
			stmt.setString(3, property.getCity());
			stmt.setString(4, property.getDistrict());
			stmt.setString(5, property.getWard());
			stmt.setString(6, property.getStreet());
			result = stmt.executeUpdate();
			connect.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public static int insertPicture(Property property) {
		int result = 0;
		try {
			String query = "INSERT INTO property_photos(property_id, photo_name, description) VALUES(?,?,?)";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			stmt.setString(2, property.getPictures().get(1)[0]);
			stmt.setString(3, property.getPictures().get(1)[1]);
			result = stmt.executeUpdate();
			connect.close();
		} catch (SQLException e) {

		}

		return result;
	}

	public static int updateProperty(Property property) {
		int result = 0;
		try {
			String query = "UPDATE property SET price = ?, size=? WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getPrice());
			stmt.setString(2, property.getSize());
			stmt.setString(3, property.getProperty_id());
			result = stmt.executeUpdate();
			connect.close();
		} catch (SQLException e) {

		}
		return result;
	}

	public static int updateLocation(Property property) {
		int result = 0;
		try {
			String query = "UPDATE property_location SET country=?, city=?, district=?, ward=?, street=? WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getCountry());
			stmt.setString(2, property.getCity());
			stmt.setString(3, property.getDistrict());
			stmt.setString(4, property.getWard());
			stmt.setString(5, property.getStreet());
			stmt.setString(6, property.getProperty_id());
			result = stmt.executeUpdate();
			connect.close();
		} catch (SQLException e) {

		}
		return result;
	}
	
	
	public static int deleteProperty(Property property) {
		int result = 0;
		try {
			String query = "DELETE FROM property WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			result = stmt.executeUpdate();
			connect.close();
		} catch (SQLException e) {

		}
		return result;
	}
}
