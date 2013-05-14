import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

class Register {
	String user;
	String pwd;
	String mail;
	String www;
	String birthday;
	String description;

	public Register(String user, String pwd, String mail) {
		this.user = user;
		this.pwd = pwd;
		this.mail = mail;

	}

	
	// It checks if the choosen username is available!
	
	
	
	boolean isValid() throws SQLException {

		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");

		Statement stmt = connection.createStatement();
		ResultSet rs = stmt
				.executeQuery("SELECT * FROM member WHERE login like '" + user
						+ "'");

		String user1 = "";

		while (rs.next()) {
			user1 = rs.getString("login");
		}

		if (user1.equals("null")) {

			return true;
		}

		else {

			return false;
		}
	}
	
	
	public void add() throws SQLException, ParseException{
		
		Connection connection = DriverManager.getConnection(
				"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
				"Phie5pia");
		

		System.out.println(birthday.length() + www.length() + description.length());
		
		Statement stmt = connection.createStatement();
		if (www.length() != 0 && birthday.length() != 0 && description.length() != 0){
		java.util.Date date =  new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
	    stmt.executeUpdate("INSERT INTO member(login,member_password,mail,www,birthday,description)" + 
		"VALUES('"+user+"','"+pwd+"','"+mail+"', '"+www+"', '"+date+"', '"+description+"')");
	    		
		}
		
		
		if (www.length() == 0 && birthday.length()==0 && description.length()==0){
		    stmt.executeUpdate("INSERT INTO member(login,member_password,mail)" + 
			"VALUES('"+user+"','"+pwd+"','"+mail+"')");
		  	}
		
		if (www.length() != 0 && birthday.length()==0 && description.length()==0){
		    stmt.executeUpdate("INSERT INTO member(login,member_password,mail,www)" + 
			"VALUES('"+user+"','"+pwd+"','"+mail+"', '"+www+"')");
		  	}
		
		if (www.length() != 0 && birthday.length()!=0 && description.length()==0){
			java.util.Date date =  new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
		    stmt.executeUpdate("INSERT INTO member(login,member_password,mail,www)" + 
			"VALUES('"+user+"','"+pwd+"','"+mail+"', '"+www+"', '"+date+"')");
		  	}
	    	
		if (www.length() == 0 && birthday.length()!=0 && description.length()!=0){
			java.util.Date date =  new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
		    stmt.executeUpdate("INSERT INTO member(login,member_password,mail,birthday,description)" + 
			"VALUES('"+user+"','"+pwd+"','"+mail+"', '"+date+"', '"+description+"')");
		  	}
		
		
		if (www.length() != 0 && birthday.length()==0 && description.length()!=0){
	    stmt.executeUpdate("INSERT INTO member(login,member_password,mail,www,description)" + 
		"VALUES('"+user+"','"+pwd+"','"+mail+"', '"+www+"', '"+description+"')");

	}
		if (www.length() != 0 && birthday.length()!=0 && description.length()!=0){
			java.util.Date date =  new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
			stmt.executeUpdate("INSERT INTO member(login,member_password,mail,www,birthday)" + 
					"VALUES('"+user+"','"+pwd+"','"+mail+"', '"+www+"', '"+date+"')");

		}

	
	
	
	}

}
