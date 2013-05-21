package domain;

import java.util.LinkedList;
import java.util.List;

public class State {

	private int id ;
	private String name;
	private int propPoint =1;
	private List<Integer> alterPoint;
	
	public State (int id, String name){
		this.id = id;
		this.name =name;
		alterPoint = new LinkedList<Integer>();
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
	public int getPropPoint() {
		return propPoint;
	}
	public void setPropPoint(int propPoint) {
		this.propPoint = propPoint;
	}
	public List<Integer> getAlterPoint() {
		return alterPoint;
	}
	public void setAlterPoint(List<Integer> alterPoint) {
		this.alterPoint = alterPoint;
	}
	
	
}
