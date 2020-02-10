package controler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import business.Property;
import business.User;
import database.LandDb;

/**
 * Servlet implementation class AddPhoto
 */
@WebServlet("/user/addphoto")
@MultipartConfig
public class AddPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_PATH = "uploads";    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = "";
		String url = "/user/property.jsp";
		HttpSession session = request.getSession(false);
		if (ServletFileUpload.isMultipartContent(request) && session != null) {
			String caption = request.getParameter("caption");
			Part file = request.getPart("pic"); // getting uploaded file

			String filename = file.getSubmittedFileName(); // getting name of the uploaded file
			File savePath = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_PATH);
			if (!savePath.exists()) {
				savePath.mkdir();
			}
			Property property = (Property) session.getAttribute("property");
			User user = (User) session.getAttribute("user");
			
			if (property != null && user != null && filename != null) {
				url = "/user/property.jsp?id=" + property.getProperty_id();
				if (!filename.isEmpty()) {
					filename = generateFilename(filename, property.getProperty_id());
					file.write(savePath + File.separator + filename);
					TreeMap<Integer, String[]> picture = new TreeMap<Integer, String[]>();
					picture.put(1, new String[] {filename,caption});
					property.setPictures(picture);
					int result = LandDb.insertPicture(property);
					if (result == 1) {
						message = "sucessfull added";
					} else {
						message = "failed";
					}
				}else {
					message = "Empty file name";
				}
				
			}
		}else {
			message = "Not appload file or session not included";
		}
		
		

		request.setAttribute("message", message);
		request.getServletContext().getRequestDispatcher(url).forward(request, response);

	}
	
	private String generateFilename(String initialName, String newName) {
		// getting extension of the file and concatenate with its extension
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSS");
		LocalDateTime time = LocalDateTime.now();
		String id=formatter.format(time);
		newName = newName + id + initialName.substring(initialName.lastIndexOf("."));
		return newName;
	}

}
