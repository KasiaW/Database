package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

class Password {
	String user;
	String cur;
	String newP;
	
	

	
	public Password(String user, String cur, String newP)
		{
		this.user = user;
		this.cur = cur;
		this.newP = newP;
		
	

	}

	boolean isValid() throws SQLException {
		

		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");

		Statement stmt = connection.createStatement();
		ResultSet rs = stmt
				.executeQuery("SELECT * FROM member WHERE login LIKE '" + user
						+ "'");

	
		String password = "";

		while (rs.next()) {
			password = rs.getString("member_password");
		}
		
		if (password.equals(cur)){
			return true;
		}
		
		else
		{return false;}
		
	}
	
	
	public void update() throws SQLException{
		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");
		
		Statement stmt = connection.createStatement();
		
		stmt.executeUpdate("UPDATE member SET member_password='"+newP+"' WHERE login='"+user+"';");
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	

}