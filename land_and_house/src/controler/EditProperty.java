package controler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import business.House;
import business.Land;
import business.Property;
import business.User;
import database.HouseDb;
import database.LandDb;
import database.PropertyDb;

/**
 * Servlet implementation class EditProperty
 */
@WebServlet("/user/editproperty")
@MultipartConfig
public class EditProperty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String message = "Nothing happned";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String updateValue = request.getParameter("new");
		String password = request.getParameter("password");
		String action = request.getParameter("action");
		String url = "/user/property.jsp";
		HttpSession session = request.getSession(false);
		
		//if statements to that check condition to update property information
		if (updateValue != null && action != null) {
			if (session != null) {
				Property property = (Property) session.getAttribute("property");
				User user = (User) session.getAttribute("user");
				if (property != null && user != null) {
					url = "/user/property.jsp?id=" + property.getProperty_id();
					int result = editProperty(request, property);
					if (result == 1) {
						message = "sucessfull edited";
					} else {
						message = "failed";
					}
				}
			}

		}
		//if statements to that check condition to delete property
		if (action != null && session != null && password != null) {
			Property property = (Property) session.getAttribute("property");
			User user = (User) session.getAttribute("user");
			if (property != null && user != null) {
				if (user.getPassword().equals(password)) {
					int result = editProperty(request, property);
					if (result == 1) {
						message = "sucessfull deleted";
					} else {
						message = "failed to delete";
						url = "/user/property.jsp?id=" + property.getProperty_id();
					}
				} else {
					message = "Please enter correct password";
				}

			}

		}
		
		
		//if statements to that check condition to add  property picture
		/*if(ServletFileUpload.isMultipartContent(request) && action != null) {
			
			String caption = request.getParameter("caption");
			Part file = request.getPart("photo"); // getting uploaded file
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
			message = "Not appload file or action not included";
		}*/
		
		
		
		
		request.setAttribute("message", message);
		request.getServletContext().getRequestDispatcher(url).forward(request, response);

	}

	private int editProperty(HttpServletRequest request, Property property) {
		int result = 0;
		String updateValue = request.getParameter("new");
		House house = HouseDb.getHouse(property.getProperty_id());
		Land land = LandDb.getLand(property.getProperty_id());
		String action = request.getParameter("action");
		switch (action) {
		case "price":
			property.setPrice(updateValue);
			result = PropertyDb.updateProperty(property);
			break;
		case "size":
			property.setSize(updateValue);
			result = LandDb.updateLand(land);
			break;
		case "country":
			property.setCountry(updateValue);
			result = PropertyDb.updateLocation(property);
			break;
		case "city":
			property.setCity(updateValue);
			result = PropertyDb.updateLocation(property);
			break;
		case "district":
			property.setDistrict(updateValue);
			result = PropertyDb.updateLocation(property);
			break;
		case "ward":
			property.setWard(updateValue);
			result = PropertyDb.updateLocation(property);
			break;
		case "street":
			property.setStreet(updateValue);
			result = PropertyDb.updateLocation(property);
			break;
		case "house-no":
			house.setHouse_no(updateValue);
			result = HouseDb.updateHouse(house);
			break;
		case "year-built":
			house.setYear_built(updateValue);
			result = HouseDb.updateHouse(house);
			break;
		case "floor":
			house.setFloor(Integer.parseInt(updateValue));
			result = HouseDb.updateHouse(house);
			break;
		case "bedroom":
			house.setBedroom(Integer.parseInt(updateValue));
			result = HouseDb.updateHouse(house);
			break;
		case "livingroom":
			house.setLivingroom(Integer.parseInt(updateValue));
			result = HouseDb.updateHouse(house);
			break;
		case "toilet":
			house.setToilet(Integer.parseInt(updateValue));
			result = HouseDb.updateHouse(house);
			break;
		case "water":
			house.setWater(updateValue);
			result = HouseDb.updateHouse(house);
			break;
		case "garage":
			house.setGarage(updateValue);
			result = HouseDb.updateHouse(house);
			break;
		case "electric":
			house.setElectricity(updateValue);
			result = HouseDb.updateHouse(house);
			break;
		case "other":
			house.setOther_features(updateValue);
			result = HouseDb.updateHouse(house);
			break;
		case "land-type":
			land.setLand_type(updateValue);
			result = LandDb.updateLand(land);
			break;
		case "other-land":
			land.setFeatures(updateValue);
			result = LandDb.updateLand(land);
			break;
		case "delete-property":
			result = PropertyDb.deleteProperty(property);
			break;
		default:
			message = "failed";
			break;
		}
		return result;
	}

}
