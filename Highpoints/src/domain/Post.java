package domain;

import java.sql.Date;

public class Post {

	private int id;
	private Date date;
	private String category;
	private String content;
	private String author;
	
	public Post (int id, Date date, String category, String content, String author){
		this.id = id;
		this.date = date;
		this.category = category;
		this.content = content;
		this.author = author;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
}
