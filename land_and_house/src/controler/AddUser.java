package controler;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.User;
import database.UserDb;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet({ "/ControllerServlet", "/register" })
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "";
	String action = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String firstname = request.getParameter("first-name");
		String lastname = request.getParameter("last-name");
		String phone = request.getParameter("phone");
		String message="";
		if (email == null || password == null || password2 == null || firstname == null || lastname == null || phone == null) {
			message = "<span class='text-danger font-weight-bold'>Please fill all details before submiting the form </span>";
			url="/register.jsp";
		} else {
			if (password.equals(password2)) {
				User user = new User();
				user.setEmail(email);
				user.setPassword(password);
				user.setFirst_name(firstname);
				user.setLast_name(lastname);
				user.setPhone(phone);
				HttpSession userSession = request.getSession();
				message = addUser(user,userSession);
				if(message.equals("Done")) {
					/*response.sendRedirect("/land_and_house/user/");*/
				}
			} else {
				message = "<span class='text-danger font-weight-bold'>Password doesn't match, Please Enter passwords carefully</span>";
				url="/register.jsp";
			}
		}
		request.setAttribute("message", message);
		request.setAttribute(action, action);
		getServletContext().getRequestDispatcher(url).forward(request, response);

	}

	public String addUser(User user, HttpSession userSession) {
		String message = "";
		if (checkUsername(user)) {
			int i = UserDb.insertUser(user);
			i=UserDb.insertUserProfile(user);
			if (i == 1) {
				message = "<span class='text-success font-weight-bold'>User Added Successfully</span>";
				userSession.setAttribute("user", user);
				message = "Done";
				url="/user/";
			} else {
				message = "<span class='text-danger font-weight-bold'>Sorry error in database failed</span>";
				url="/register.jsp";
			}
		} else {
			message = "<span class='text-danger font-weight-bold'>Username already exist in database</span>";
			url="/register.jsp";
		}
		return message;
	}

	/*
	 * Method to check if username exists in the database; true if name is available
	 * for use and false name is not available, already used*
	 */
	public Boolean checkUsername(User user) {
		ArrayList<User> users = UserDb.getUsers();
		Boolean available = true;
		for (User use : users) {
			if (use.getEmail().equals(user.getEmail())) {
				return false;
			}
		}
		return available;
	}

}
