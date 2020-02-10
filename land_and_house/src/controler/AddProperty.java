package controler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

import business.House;
import business.Land;
import business.User;
import database.HouseDb;
import database.LandDb;
import database.PropertyDb;

/**
 * Servlet implementation class AddNotice
 */
@WebServlet(description = "Servlet for uploading notices", urlPatterns = { "/user/addproperty" })
@MultipartConfig
public class AddProperty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_PATH = "uploads";

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
		String message = "";
		String url = "/user/addproperty.jsp";
		HttpSession userSession = request.getSession();
		User user = (User) userSession.getAttribute("user");
		if (user == null) {
			response.sendRedirect("/land_and_house/login.jsp");
		} else {
			if (ServletFileUpload.isMultipartContent(request)) {

				// Retrieving submitted values
				String type = request.getParameter("type");
				String price = request.getParameter("price");
				String size = request.getParameter("size");
				String country = request.getParameter("country");
				String district = request.getParameter("district");
				String region = request.getParameter("region");
				String ward = request.getParameter("ward");
				String street = request.getParameter("street");
				String owner = user.getEmail();
				String property_id = generateId();
				String caption = request.getParameter("caption");
				Part file = request.getPart("pic"); // getting uploaded file

				String filename = file.getSubmittedFileName(); // getting name of the uploaded file
				File savePath = new File(getServletContext().getRealPath("") + File.separator + UPLOAD_PATH);
				if (!savePath.exists()) {
					savePath.mkdir();
				}

				if (filename != null && !filename.isEmpty()) {
					filename = generateFilename(filename, property_id);
					file.write(savePath + File.separator + filename);
					TreeMap<Integer, String[]> picture = new TreeMap<Integer, String[]>();
					picture.put(1, new String[] {filename,caption});
					
					

					if (type.toLowerCase().equals("land".toLowerCase())) {
						String land_type = request.getParameter("land-type");
						String features = request.getParameter("land-features");

						/* creating land object and setSome of its properties */

						Land land = new Land();
						land.setProperty_id(property_id);
						land.setOwner(owner);
						land.setSize(size);
						land.setType(getType(type));
						land.setPrice(price);
						land.setPictures(picture);
						land.setCountry(country);
						land.setDistrict(district);
						land.setCity(region);
						land.setLand_type(land_type);
						land.setFeatures(features);
						land.setLand_id(property_id);
						land.setStreet(street);
						land.setWard(ward);
						
						int la = LandDb.insertLand(land);
						int lo = LandDb.insertLocation(land);
						int p = LandDb.insertPicture(land);
						if(la == 1 && lo ==1 && p==1) {
							message = "Land  added successfully";
						}

					} else if (type.toLowerCase().equals("house".toLowerCase())) {
						String house_no = request.getParameter("house-no");
						String floor = request.getParameter("floor");
						String bedroom = request.getParameter("bedroom");
						String living = request.getParameter("living");
						String toilet = request.getParameter("toilet");
						String water = request.getParameter("water");
						String electricity = request.getParameter("electricity");
						String features = request.getParameter("house-features");
						String year_built = request.getParameter("year-built");
						String garage = request.getParameter("garage");

						/* creating house object and setSome of its properties */

						House house = new House();
						house.setProperty_id(property_id);
						house.setOwner(owner);
						house.setType(getType(type));
						house.setPrice(price);
						house.setSize(size);
						house.setPictures(picture);
						house.setCountry(country);
						house.setDistrict(district);
						house.setCity(region);
						house.setStreet(street);
						house.setWard(ward);
						house.setHouse_no(house_no);
						house.setFloor(Integer.parseInt(floor));
						house.setBedroom(Integer.parseInt(bedroom));
						house.setLivingroom(Integer.parseInt(living));
						house.setToilet(Integer.parseInt(toilet));
						house.setWater(water);
						house.setElectricity(electricity);
						house.setOther_features(features);
						house.setYear_built(year_built);
						house.setGarage(garage);
						
						int ho= HouseDb.insertHouse(house);
						int lo = HouseDb.insertLocation(house);
						int p = HouseDb.insertPicture(house);
						if(ho == 1 && lo ==1 && p==1) {
							message = "House  uploaded successfully";
						}
					}

				} else {
					message = "Your request doesn't contain upload file";
				}

			} else {
				System.out.println("Your request doesn't contain upload file");
				message = "Your request doesn't contain upload file";
			}

			request.setAttribute("message", message);
			request.getServletContext().getRequestDispatcher(url).forward(request, response);
		}

	}

	private String generateId() {
		String id;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSS");
		LocalDateTime time = LocalDateTime.now();
		// TODO check if noticeId exists

		id = formatter.format(time);
		return id;
	}

	private String generateFilename(String initialName, String newName) {
		// getting extension of the file and concatenate with its extension
		newName = newName + "1" + initialName.substring(initialName.lastIndexOf("."));
		return newName;
	}
	
	private String getType(String type) {
		ArrayList<String[]> types= PropertyDb.getTypes();
		String id="";
		for(String[] t:types) {
			if(t[1].toLowerCase().equals(type)) {
				id=t[0];
			}
		}
		return id;
	}

}
