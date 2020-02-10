package business;

public class House extends Property{
	
	private String house_no;
	private int floor;
	private int type_id;
	private int bedroom;
	private int livingroom;
	private int toilet;
	private String electricity;
	private String water;
	private String year_built;
	private String garage;
	private String other_features;
	
	public House() {
		this.house_no = "";
		this.floor = 0;
		this.type_id = 0;
		this.bedroom = 0;
		this.livingroom = 0;
		this.toilet = 0;
		this.electricity = "";
		this.year_built = "";
		this.garage = "";
		this.water = "";
		this.other_features = "";	
	}
	
	public House(String id, int type,int type_id, int bedroom, int livingroom, int toilet, String electricity, String water, String features) {
		this.house_no = id;
		this.floor = type;
		this.type_id = type_id;
		this.bedroom = bedroom;
		this.livingroom = livingroom;
		this.toilet = toilet;
		this.electricity = electricity;
		this.year_built = "";
		this.garage = "";
		this.water = water;
		this.other_features = features;
		
	}

	public String getHouse_no() {
		return house_no;
	}

	public void setHouse_no(String house_no) {
		this.house_no = house_no;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public int getBedroom() {
		return bedroom;
	}

	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}

	public int getLivingroom() {
		return livingroom;
	}

	public void setLivingroom(int livingroom) {
		this.livingroom = livingroom;
	}

	public int getToilet() {
		return toilet;
	}

	public void setToilet(int toilet) {
		this.toilet = toilet;
	}

	public String getElectricity() {
		return electricity;
	}

	public void setElectricity(String electricity) {
		this.electricity = electricity;
	}

	public String getWater() {
		return water;
	}

	public void setWater(String water) {
		this.water = water;
	}

	public String getOther_features() {
		return other_features;
	}

	public void setOther_features(String other_features) {
		this.other_features = other_features;
	}
	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getYear_built() {
		return year_built;
	}

	public void setYear_built(String year_built) {
		this.year_built = year_built;
	}

	public String getGarage() {
		return garage;
	}

	public void setGarage(String garage) {
		this.garage = garage;
	}
	

}
