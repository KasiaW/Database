package domain;

import java.sql.Date;

public class Post {

	private int id;
	private Date date;
	private String category;
	private String content;
	
	public Post (int id, Date date, String category, String content){
		this.id = id;
		this.date = date;
		this.category = category;
		this.content = content;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
