package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.Comment;
import business.User;
import database.CommentDb;

/**
 * Servlet implementation class Comment
 */
@WebServlet("/user/comment")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String commentMessage = request.getParameter("comment");
		String property_id = request.getParameter("id");
		String url = "/user/viewproperty.jsp";
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(commentMessage != null && user !=null && property_id !=null) {
			if(!commentMessage.isEmpty()&& !user.getEmail().isEmpty() && !property_id.isEmpty()) {
				url = "/user/viewproperty.jsp?id="+property_id;
				Comment comment = new Comment();
				comment.setComment(commentMessage);
				comment.setCommenter(user.getEmail());
				comment.setProperty(property_id);
				CommentDb.insertComment(comment);
			}
		}
		request.getServletContext().getRequestDispatcher(url).forward(request, response);

	}

}
