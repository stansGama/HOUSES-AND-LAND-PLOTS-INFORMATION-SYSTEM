package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import business.User;

public class UserDb {
	private static String url = "jdbc:mysql://localhost/house_and_land";
	private static String username = "root";
	private static String pass = "@Wasternie96";
	
	
	
	public static void main(String args[]) {
		User user = UserDb.getUser("admin@notice.com");
		user.setDistrict("Songea");
		user.setFirst_name("");
		user.setLast_name("ert");
		user.setPhone("334556");
		if(insertUserProfile(user) == 1) {
			System.out.print("Done");
		}
	}

	public static User getUser(String email) {
		User user = new User();
		try {
			String query = "SELECT * FROM user WHERE email=?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, email);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				user.setEmail(result.getString("email"));
				user.setPassword(result.getString("password"));
				user.setCreated_time(result.getString("created_time"));
			}
			return user;
		} catch (SQLException e) {
		}
		return user;

	}

	public static User getProfile(String email) {
		User user = new User();
		try {
			String query = "SELECT * FROM user_profile WHERE email=?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, email);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				user.setEmail(result.getString("email"));
				user.setFirst_name(result.getString("first_name"));
				user.setLast_name(result.getString("last_name"));
				user.setDob(result.getString("DOB"));
				user.setPhone(result.getString("phone_number"));
				user.setCountry(result.getString("country"));
				user.setDistrict(result.getString("district"));
				user.setCity(result.getString("city"));
			}
			return user;
		} catch (SQLException e) {
			
		}
		return user;
	}
	
	public static int updateProfile(User user) {
		int result = 0;
		try {
			String query = "UPDATE user_profile SET first_name=?, last_name=?, phone_number=?, DOB=?, country=?, city=?, "
					+ "district=? WHERE email=?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, user.getFirst_name());
			stmt.setString(2, user.getLast_name());
			stmt.setString(3, user.getPhone());
			stmt.setString(4, user.getDob());
			stmt.setString(5, user.getCountry());
			stmt.setString(6, user.getCity());
			stmt.setString(7, user.getDistrict());
			stmt.setString(8, user.getEmail());

	
			result = stmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public static int updatePassword(User user) {
		int result = 0;
		try {
			String query = "UPDATE user SET password=? WHERE email=?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, user.getPassword());
			stmt.setString(2, user.getEmail());
			result = stmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public static ArrayList<User> getUsers() {
		ArrayList<User> users = new ArrayList<>();
		try {
			String query = "SELECT * FROM user";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				User user = new User();
				user.setEmail(result.getString("email"));
				user.setPassword(result.getString("password"));
				user.setCreated_time(result.getString("created_time"));
				users.add(user);
			}
			return users;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return users;
	}

	public static int insertUser(User user) {
		int result = 0;
		try {
			String query = "INSERT INTO user (email, password) VALUES (?,?)";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());
			result = stmt.executeUpdate();
		} catch (SQLException e) {

		}
		return result;
	}
	public static int insertUserProfile(User user) {
		int result = 0;
		try {
			String query = "INSERT INTO user_profile (email,first_name, last_name, phone_number, DOB, country, city, district) "
					+ "VALUES (?,?,?,?,?,?,?,?)";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getFirst_name());
			stmt.setString(3, user.getLast_name());
			stmt.setString(4, user.getPhone());
			stmt.setString(5, user.getDob());
			stmt.setString(6, user.getCountry());
			stmt.setString(7, user.getCity());
			stmt.setString(8, user.getDistrict());
			
			result = stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
