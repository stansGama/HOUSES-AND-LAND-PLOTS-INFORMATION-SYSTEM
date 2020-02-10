package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import business.Comment;
import business.Property;

public class CommentDb {
	private static String url = "jdbc:mysql://localhost/house_and_land";
	private static String username = "root";
	private static String pass = "@Wasternie96";
	
	public static void main(String [] arg) {
		Property property = PropertyDb.getProperty("20190526_09265681");
		ArrayList<Comment> comments = property.getComments();
		for(Comment comment:comments) {
			System.out.print(comment.getComment()+" ");
			System.out.println(comment.getCommenter());
		}
	}
	
	
	
	
	
	/*Method that return property comments*/
	public static ArrayList<Comment> getComment(Property property, Connection connect){
		ArrayList<Comment> comments = new ArrayList<>();
		try {
			String query ="SELECT * FROM comment WHERE property = ?";
			PreparedStatement stmt =  connect.prepareStatement(query);
			stmt.setString(1, property.getProperty_id());
			ResultSet result = stmt.executeQuery();
			while(result.next()) {
				Comment comment = new Comment();
				comment.setComment(result.getString("comment"));
				comment.setCommenter(result.getString("commenter"));
				comment.setTime(result.getString("time"));
				comments.add(comment);
			}
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return comments;
	}
	
	public static int insertComment(Comment comment) {
		int result = 0;
		try {
			String query ="INSERT INTO comment (comment, commenter, property) VALUES (?,?,?)";
			Connection connect = DriverManager.getConnection(url, username, pass);
			PreparedStatement stmt =  connect.prepareStatement(query);
			stmt.setString(1, comment.getComment());
			stmt.setString(2, comment.getCommenter());
			stmt.setString(3, comment.getProperty());
			result = stmt.executeUpdate();	
		}catch(SQLException e) {
			
		}
		return result;
	}
	
}
