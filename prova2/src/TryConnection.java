
import java.sql.*;
 
public class TryConnection {
 
	public static void main(String[] argv) throws SQLException {
			Connection connection = DriverManager.getConnection(
					"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
					"Phie5pia");
			
			Statement stmt = connection.createStatement();
            ResultSet rs;
 
            rs = stmt.executeQuery("SELECT * FROM point");
            
            while ( rs.next() ) {
                String point_id = rs.getString("point_id");
                String point_name = rs.getString("point_name");
                String elevation = rs.getString("elevation");
                
                System.out.println();
                System.out.print(point_id + " ");
                System.out.print(point_name + " ");
                System.out.print(elevation +  " ");
 

}}}