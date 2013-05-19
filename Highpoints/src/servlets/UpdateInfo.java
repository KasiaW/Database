package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class UpdateInfo {
	String user;
	String mail;
	String www;
	String date;
	String description;
	
	
	public UpdateInfo(String user, String mail, String www, String date, String description){
	this.user = user;
	this.mail = mail;
	this.www = www;
	this.date = date;
	this.description = description;
		
	}
	
	
	public void update () throws SQLException, ParseException {
		
		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");
		
		
		Statement stmt = connection.createStatement();
		java.util.Date date1 =  new SimpleDateFormat("yyyy-MM-dd").parse(date);
		stmt.executeUpdate("UPDATE member SET mail='"+mail+"', www='"+www+"', birthday='"+date1+"', description='"+description+"' WHERE login='"+user+"';");
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
