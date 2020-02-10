package controler;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import business.House;
import business.Property;
import database.HouseDb;

/**
 * Servlet implementation class Search
 */
/* @WebServlet("/user/search") */
public class Search /* extends HttpServlet */ {
	/* private static final long serialVersionUID = 1L; */

	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String message= ""; String
	 * url = "/user/search.jsp"; String priceMin =
	 * request.getParameter("price-min"); String priceMax =
	 * request.getParameter("price-max"); ArrayList<Property> searchResult = new
	 * ArrayList<>(); if(priceMin != null && priceMax != null && !priceMin.isEmpty()
	 * && !priceMax.isEmpty()) { int min = Integer.parseInt(priceMin); int max =
	 * Integer.parseInt(priceMax); ArrayList<Property> properties =
	 * PropertyDb.getProperties(); searchResult = priceRange(properties, min, max);
	 * }
	 * 
	 * request.setAttribute("message", message); request.setAttribute("search",
	 * searchResult);
	 * request.getServletContext().getRequestDispatcher(url).forward(request,
	 * response);
	 * 
	 * }
	 * 
	 * 
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { doGet(request, response); }
	 */
	
	public static ArrayList<Property> search(ArrayList<Property> properties,String location, long min, long max){
		ArrayList<Property> searchResult = new ArrayList<>();
		searchResult = priceRange(properties, min, max);
		searchResult = searchLocation(searchResult, location);
		return searchResult;
	}
	private static ArrayList<Property> priceRange(ArrayList<Property> properties, long min, long max) {
		ArrayList<Property> searchResult = new ArrayList<>();
		if(min == 0 && max == -1) {
			searchResult = properties;
			return searchResult;
		}
		if (min > max) {
			return searchResult;
		} else {
			for (Property property : properties) {
				long price = Long.parseLong(property.getPrice());
				if (price >= min && price <= max) {
					searchResult.add(property);
				}
			}

		}
		return searchResult;
	}

	private static ArrayList<Property> searchLocation(ArrayList<Property> properties, String location) {
		ArrayList<Property> searchResult = new ArrayList<>();
		for (Property property : properties) {
			String pCity = property.getCity().toLowerCase();
			String pDistrict = property.getDistrict().toLowerCase();
			String pWard = property.getWard().toLowerCase();
			String pStreet = property.getStreet().toLowerCase();
			Pattern pattern = Pattern.compile(location.toLowerCase());
			Matcher match = pattern.matcher(pCity);
			if (match.find()) {
				searchResult.add(property);
				continue;
			} else {
				match = pattern.matcher(pDistrict);
				if (match.find()) {
					searchResult.add(property);
					continue;
				} else {
					match = pattern.matcher(pWard);
					if (match.find()) {
						searchResult.add(property);
						continue;
					} else {
						match = pattern.matcher(pStreet);
						if (match.find()) {
							searchResult.add(property);
						}
					}
				}
			}

		}
		return searchResult;
	}
	
	public static ArrayList<Property> searchHouse(ArrayList<Property> properties, int bedroom, int toilet, String water, String electricity){
		ArrayList<Property> propertyResult = new ArrayList<Property>();
		
		for(Property property: properties) {
			if(property.getType().equals("2")) {
				continue;
			}
			boolean add = false;
			House house = HouseDb.getHouse(property.getProperty_id());
			
			if(house.getBedroom() < bedroom) {
				continue;
			} else if(house.getToilet() < toilet) {
				continue;
			}else {
				add = true;
			}
			
			if(add == false)continue;
			
			
			
			switch(water.toLowerCase()){
			case "both":
				add = true;
				break;
			case "yes":
				if(house.getWater().toLowerCase().equals("yes")) {
					add = true;
				}else{
					add = false;
				}
				break;
			case "no":
				if(house.getWater().toLowerCase().equals("no")) {
					add = true;
				}else{
					add = false;
				}
				break;
			default:
				add = false;
					
			}
			if(add == false)continue;
			
			switch(electricity.toLowerCase()){
			case "both":
				add = true;
				break;
			case "yes":
				if(house.getElectricity().toLowerCase().equals("yes")) {
					add = true;
				}else{
					add = false;
				}
				break;
			case "no":
				if(house.getElectricity().toLowerCase().equals("no")) {
					add = true;
				}else{
					add = false;
				}
				break;
			default:
				add = false;
					
			}
			
			if(add) {
				propertyResult.add(property);
			}
		
		}
		return propertyResult;
	}

}
