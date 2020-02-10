package business;

import java.util.ArrayList;
import java.util.TreeMap;

public class Property {
	
	protected String property_id;
	protected String owner;
	protected String type;
	protected String price;
	protected String size;
	protected TreeMap<Integer, String[]> pictures = new TreeMap<Integer, String[]>();
	protected String country;
	protected String city;
	protected String district;
	protected String ward;
	protected String street;
	protected ArrayList<Comment> comments;
	
	
	public Property() {
		this.property_id = "";
		this.type = "";
		this.owner = "";
		this.price = "";
		this.pictures.put(0, new String[] {"",""});
		this.country = "";
		this.city = "";
		this.district = "";
		this.street = "";
		this.ward = "";
		this.comments = new ArrayList<Comment>();
		
	}
	public Property(String id, String owner, String type, String price) {
		this.property_id = id;
		this.owner = owner;
		this.type = type;
		this.price = price;
		this.pictures.put(0, new String[] {"",""});
		this.country = "";
		this.city = "";
		this.district = "";
		this.street = "";
		this.ward = "";
		this.comments = new ArrayList<Comment>();
	}
	
	public Property(String id, String owner, String type, String price, 
			TreeMap<Integer, String[]> pictures,String country, String city,String district, String ward, String street) {
		this.property_id = id;
		this.owner = owner;
		this.type = type;
		this.price = price;
		this.pictures = pictures;
		this.country = country;
		this.city = city;
		this.district = district;
		this.street = street;
		this.ward = ward;
		this.comments = new ArrayList<Comment>();
	}
	public String getProperty_id() {
		return property_id;
	}
	public void setProperty_id(String property_id) {
		this.property_id = property_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public TreeMap<Integer, String[]> getPictures() {
		return pictures;
	}
	public void setPictures(TreeMap<Integer, String[]> pictures) {
		this.pictures = pictures;
	}
	public ArrayList<Comment> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
}
