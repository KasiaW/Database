package servlets;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Comment {
	
		String content;
		String author;
		String idPost;

		public Comment (String idPost, String content, String author){
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
		    stmt.executeUpdate("INSERT INTO comment(comment_idPost,comment_content,comment_author)" + 
			"VALUES('"+idPost+"', '"+author+"', '"+content+"',)' ");
		    		
			}
			
			
		}

	
}
