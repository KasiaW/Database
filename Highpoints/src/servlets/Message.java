package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class Message {
	public String user;
	private String addressee;
	private String title;
	private String text;
	
	
	
	public Message(String user, String addressee, String title, String text){
		this.user = user;
		this.addressee = addressee;
		this.title = title;
		this.text = text;
	
	}
	
	
	public void insert() throws SQLException{
		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");
		
		Statement stmt = connection.createStatement();
		
	    stmt.executeUpdate("INSERT INTO private_messagge(msg_title,msg_content,addressee,sender)" + 
		"VALUES('"+title+"','"+text+"','"+addressee+"', '"+user+"')");
		
	}
	
	public boolean validMember () throws SQLException{
		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM member WHERE login = '"+addressee+"'");

	    
	    String user1="";
	
	    

	    while ( rs.next() ) {
	         user1 = rs.getString("login");}
	    
		if (user1.length() == 0){
			return false;
		}
		else{
	    
	    
		
		return true;
	}
	
	
}
}