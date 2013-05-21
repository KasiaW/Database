package domain;

public class Point {

	private int id;
	private String name;
	private double elevation;
	private String difficulty;
	private String description;
	private String routes;
	private String pointAccess;
	
	public Point(int id, String name){
		this.id = id;
		this.name =name;
		elevation = 0.0;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getElevation() {
		return elevation;
	}

	public void setElevation(double elevation) {
		this.elevation = elevation;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRoutes() {
		return routes;
	}

	public void setRoutes(String routes) {
		this.routes = routes;
	}

	public String getPointAccess() {
		return pointAccess;
	}

	public void setPointAccess(String point_access) {
		this.pointAccess = point_access;
	}
}
