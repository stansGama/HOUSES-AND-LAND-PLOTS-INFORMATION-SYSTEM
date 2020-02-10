package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.User;
import database.UserDb;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/user/editprofile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message = "";
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String updateValue = request.getParameter("new");
		String password = request.getParameter("password");
		String action = request.getParameter("action");
		String url = "/user/profile.jsp";
		
		if( updateValue != null && password != null && action != null) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				User user = (User)session.getAttribute("user");
				if( user != null ) {
					int result = editProfile(request, user);
					if(result == 1) {
						message = "sucessfull edited";
					}
				}
				
			}
		}
		request.setAttribute("message", message);
		request.getServletContext().getRequestDispatcher(url).forward(request, response);
	}
	
	private int editProfile(HttpServletRequest request, User user) {
		int result = 0;
		String updateValue = request.getParameter("new");
		String password = request.getParameter("password");
		String passwordV =  request.getParameter("newVerify");
		String action = request.getParameter("action");
		
		if(password.equals(user.getPassword())) {
			user = UserDb.getProfile(user.getEmail());
			switch (action) {
			case "firstName":
				user.setFirst_name(updateValue);
				result = UserDb.updateProfile(user);
				break;
			case "lastName":
				user.setLast_name(updateValue);
				result = UserDb.updateProfile(user);
				break;
			case "phoneNumber":
				user.setPhone(updateValue);
				result = UserDb.updateProfile(user);
				break;
			case "dob":
				user.setDob(updateValue);
				result = UserDb.updateProfile(user);
				break;
			case "country":
				user.setCountry(updateValue);
				result = UserDb.updateProfile(user);
				break;
			case "city":
				user.setCity(updateValue);
				result = UserDb.updateProfile(user);
				break;
			case "password":
				if(updateValue.equals(passwordV)) {
					user.setPassword(updateValue);
					result = UserDb.updatePassword(user);
				}else {
					message = "Password and Verification password didn't match";
				}
				break;
				
			default:
				break;
			}
		}else {
			message = "Please enter valid password";
		}
		return result;
	}

}
