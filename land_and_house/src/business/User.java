package business;

public class User {
	
	private String email;
	private String password;
	private String created_time;
	private String first_name;
	private String last_name;
	private String phone;
	private String dob;
	private String country;
	private String city;
	private String district;
	
	public User() {
		email = "";
		password = "";
		created_time = "";
		first_name = "";
		last_name = "";
		phone = "";
		country = "";
		city = "";
		district = "";
	}
	public User(String email, String password, String time) {
		this.email = email;
		this.password = password;
		this.created_time = time;
		first_name = "";
		last_name = "";
		phone = "";
		dob ="";
		country = "";
		city = "";
		district = "";
		
	}
	
	
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
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
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreated_time() {
		return created_time;
	}
	public void setCreated_time(String createdTime) {
		this.created_time = createdTime;
	}
	
	
}
