package business;

public class Land extends Property{
	private String land_id;
	private String land_type;
	private String features;
	
	
	public Land() {
		this.land_id = "";
		this.features = "";
	}
	public Land(String id, String features) {
		this.land_id = id;
		this.features = features;
	}

	public String getLand_id() {
		return land_id;
	}

	public void setLand_id(String land_id) {
		this.land_id = land_id;
	}
	
	
	public String getLand_type() {
		return land_type;
	}
	public void setLand_type(String land_type) {
		this.land_type = land_type;
	}
	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

}
