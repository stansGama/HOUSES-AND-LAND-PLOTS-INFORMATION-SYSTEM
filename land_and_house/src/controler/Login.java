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
 * Servlet class to implement Login of the user to the system
 */
@WebServlet(description = "Servlet to control user login", urlPatterns = { "/login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String message = "";
		String action = request.getParameter("action");
		if (action != null) {
			if (action.equals("logout")) {
				HttpSession session = request.getSession();
				session.invalidate();
				this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			} else {
				if (email == null || password == null) {
					message = "Please fill all details before submiting the form";
					request.setAttribute("message", message);
					this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
				} else {
					if (isAvailable(email)) {
						User user = UserDb.getUser(email);
						if (user.getPassword().equals(password)) {
							HttpSession userSession = request.getSession();
							userSession.setAttribute("user", user);
							message = "Done";
							response.sendRedirect("user");

						} else {
							message = "Invalid username or password";
							request.setAttribute("message", message);
							this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
						}

					} else {
						message = "Invalid username or password";
						request.setAttribute("message", message);
						this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);

					}
				}
			}
		}else {
			this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}

	/*
	 * Private method to check if email exist in database
	 */

	private Boolean isAvailable(String email) {
		ArrayList<User> users = UserDb.getUsers();
		for (User user : users) {
			if (user.getEmail().equals(email)) {
				return true;
			}
		}

		return false;
	}

}
