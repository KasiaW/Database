package servlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

class Login {
String user;
String pwd;

public Login (String user, String pwd){
	this.user = user;
	this.pwd = pwd;
	
	
}


boolean isValid() throws SQLException {
	
	//Class.forName("org.postgresql.Driver"); 
	  
	 
	
	Connection connection = DriverManager.getConnection(
			"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
			"Phie5pia");
	
	
	Statement stmt = connection.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM member WHERE login like '"+user+"'");

    
    String user1="";
    String password1="";
    

    while ( rs.next() ) {
         user1 = rs.getString("login");
         password1 = rs.getString("member_password");}
    

    
    
	if (password1.equals(pwd)){
	
	return true;
}

	else
	{
		
	return false;}
	}
	
	
}




