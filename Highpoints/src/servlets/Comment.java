package servlets;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Comment {
	
		int id;
		String date;
		String content;
		String author;
		int idPost;

		public Comment (int id, String content, String author){
			this.id = id;
			this.date = date;
			this.content = content;
			this.author = author;
			this.idPost = idPost;
		}

		
		public void add() throws SQLException, ParseException{
			
			Connection connection = DriverManager.getConnection(
					"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
					"Phie5pia");
			

		
			
			Statement stmt = connection.createStatement();
			if (content.length() != 0){
			java.util.Date date1 =  new SimpleDateFormat("yyyy-MM-dd").parse(date);
		    stmt.executeUpdate("INSERT INTO comment(comment_id,comment_date,comment_content,comment_author_commentpost)" + 
			"VALUES('"+id+"','"+date+"','"+content+"', '"+author+"', '"+idPost+"',)' ");
		    		
			}
			
			
		}

	
}
