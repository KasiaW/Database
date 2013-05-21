package engine;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import domain.*;

public class DB {

	Connection connection;


	public DB(){
		try {
			connection = DriverManager.getConnection(
					"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
					"Phie5pia");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("can not connect");
		}
	}
	



	public List<State>getStatesList(){
		List <State> statess;
		HashMap<Integer,State> states = new HashMap <Integer,State>();

		Statement stmt;
		ResultSet rs;
		try {
			stmt = connection.createStatement();
		    rs = stmt.executeQuery("SELECT state.state_id, state.state_name, point.point_id" +
		    		" FROM public.point,  public.state, public.proper_point" +
		    	    " WHERE state.state_id = proper_point.p_state_id AND proper_point.p_point_id = point.point_id;"
		    	    );


		    while ( rs.next() ) {
		    	    	State s = new State(Integer.parseInt(rs.getString("state_id")),rs.getString("state_name"));
		    	    	s.setPropPoint(Integer.parseInt(rs.getString("point_id")));
		    	    	//s.getAlterPoint().add(2);
		    	    	states.put(s.getId(),s);

		    	    }
		    rs.close();
			stmt.close();
		    
		    
		    stmt = connection.createStatement();
			rs = stmt.executeQuery("SELECT *" +
				    		" FROM public.alternative_point;");

			while (rs.next()){
				State s = states.get(rs.getInt("a_state_id"));
				if (s!=null)s.getAlterPoint().add(rs.getInt("a_point_id"));
			}
			
			rs.close();
			stmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		statess =  new LinkedList<State>(states.values());

		return statess;
	}
	
	public Point getPoint(int id){
		Statement stmt;
		Point p = new Point(id,"mum");
		String a ="a";
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT *" +
		    		" FROM public.point" +
		    	    " WHERE point.point_id="+id+";"
		    	    );

		 
		   while ( rs.next() ) {
			   
		   	   	p = new Point((rs.getInt("point_id")), rs.getString("point_name"));
		    	    	String x = null;
		    	    	if ((x = rs.getString("difficulty"))!= null) p.setDifficulty(x);
		    	    	if ((x = rs.getString("description"))!= null) p.setDescription(x);
		    	    	if ((x = rs.getString("routes"))!= null) p.setRoutes(x);
		    	    	if ((x = rs.getString("point_access"))!= null) p.setPointAccess(x);
		    	    	//if ((x = rs.getString("elevation"))!= null) p.setElevation(Double.parseDouble(x));
		    	    	//p.setElevation(rs.getDouble("elevation"));

		  	    }
		rs.close();
		stmt.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}
	
	public List<String> getLocation(int pointId){
		List <String> l =new LinkedList<String>();
		Statement stmt;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT DISTINCT state.state_name "+
		    		"FROM public.proper_point, public.alternative_point, public.state " +
		    		"WHERE (proper_point.p_state_id = state.state_id AND proper_point.p_point_id = "+pointId+") OR "+
		    		"(alternative_point.a_point_id = "+pointId+" AND alternative_point.a_state_id = state.state_id);");

		   
		   while ( rs.next() ) {
			    l.add(rs.getString("state_name"));
		   	
		  	    }
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}


}