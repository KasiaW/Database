package domain;

import java.sql.Date;

public class Expedition {

	private int id;
	private Date start;
	private Date end;
	private boolean result;
	private String login;
	private int point;
	
	public Expedition(int id, Date start, Date end, boolean result, String login, int point){
		this.id = id;
		this.start = start;
		this.end = end;
		this.result = result;
		this.login = login;
		this.point = point;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
}
