package domain;
import java.sql.Date;

public class Comment {
	
		private int id;
		private Date date;
		private String content;
		private String author;
		private int idPost;
		
		public Comment (int id, Date date, String content, String author, int idPost){
			this.id = id;
			this.date = date;
			this.content = content;
			this.author = author;
			this.idPost = idPost;
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
		
		public int getIdPost() {
			return idPost;
		}
		public void setIdPost(int idPost) {
			this.idPost = idPost;
		}
		
	}

