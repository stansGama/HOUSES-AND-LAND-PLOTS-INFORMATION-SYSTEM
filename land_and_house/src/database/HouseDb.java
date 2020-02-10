package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import business.House;

public class HouseDb extends PropertyDb {

	private static String url = "jdbc:mysql://localhost/house_and_land";
	private static String username = "root";
	private static String pass = "@Wasternie96";
	
	
	public static void main(String [] arg) {
	/*	ArrayList<String []> users = getTypes();
		for(String[] types:users){
		System.out.println(types[1]);
	}*/
		
		House house = getHouse("20190605_01543365");
		System.out.println(house.getBedroom());
		System.out.println(house.getElectricity());
		System.out.println(house.getToilet());
		System.out.println("Id is:"+house.getProperty_id());
		house.setToilet(6);;
		if (HouseDb.updateHouse(house) == 1) {
			System.out.println("Done");
		}
		System.out.println(house.getOwner());
		
	}
	


	public static House getHouse(String id) {
		House house = new House();
		try {
			String query = "SELECT * FROM house WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, id);
			ResultSet result = stmt.executeQuery();
			while (result.next()) {
				house.setProperty_id(id);
				house.setHouse_no(result.getString("house_no"));
				house.setYear_built(result.getString("year_built"));
				house.setGarage(result.getString("garage"));
				house.setBedroom(result.getInt("number_of_bedrooms"));
				house.setLivingroom(result.getInt("number_of_livingroom"));
				house.setToilet(result.getInt("number_of_bedrooms"));
				house.setElectricity(result.getString("electricity_supply"));
				house.setWater(result.getString("water_supply"));
				house.setFloor(result.getInt("number_of_floor"));
				house.setOther_features(result.getString("other_features"));
			}
			connect.close();

		} catch (SQLException e) {

		}
		return house;
	}

	public static int updateHouse(House house) {
		int result =0;
		try {
			String query = "UPDATE house SET house_no =?, year_built=?, garage=?, number_of_floor=?, number_of_bedrooms=?, number_of_livingroom=?, number_of_toilets=?,"
					+ "electricity_supply=?, water_supply=?, other_features=? WHERE property_id = ?";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt = connect.prepareStatement(query);
			stmt.setString(1, house.getHouse_no());
			stmt.setString(2, house.getYear_built());
			stmt.setString(3, house.getGarage());
			stmt.setInt(4, house.getFloor());
			stmt.setInt(5, house.getBedroom());
			stmt.setInt(6, house.getLivingroom());
			stmt.setInt(7, house.getToilet());
			stmt.setString(8, house.getElectricity());
			stmt.setString(9, house.getWater());
			stmt.setString(10, house.getOther_features());
			stmt.setString(11, house.getProperty_id());
			result = stmt.executeUpdate();
			connect.close();
		}catch(SQLException e) {
			
		}
		return result;
	}
	public static int insertHouse(House house) {
		int result = 0;
		if (getProperty(house.getProperty_id()).getProperty_id().equals("")) {
			result = insertProperty(house);
			if (result == 1) {
				try {
					String query = "INSERT INTO house (house_no, number_of_floor, number_of_bedrooms, number_of_livingroom, number_of_toilets,"
							+ "electricity_supply, water_supply, other_features, property_id, year_built, garage) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
					Connection connect = DriverManager.getConnection(url, username, pass);
					PreparedStatement stmt = connect.prepareStatement(query);
					stmt.setString(1, house.getHouse_no());
					stmt.setInt(2, house.getFloor());
					stmt.setInt(3, house.getBedroom());
					stmt.setInt(4, house.getLivingroom());
					stmt.setInt(5, house.getToilet());
					stmt.setString(6, house.getElectricity());
					stmt.setString(7, house.getWater());
					stmt.setString(8, house.getOther_features());
					stmt.setString(9, house.getProperty_id());
					stmt.setString(10, house.getYear_built());
					stmt.setString(11, house.getGarage());
					result = stmt.executeUpdate();
					connect.close();

				} catch (SQLException e) {

				}
			}
		}

		return result;
	}

}
