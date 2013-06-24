package engine;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import domain.*;


public class DB {

	Connection connection;


	public DB(){
		try {
		
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(
					"jdbc:postgresql://10.7.20.170:5432/postgres", "ds_group3",
					"Phie5pia");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("can not connect");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		Point p = null;
		
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
		    	    	if ((x = rs.getString("elevation"))!= null) p.setElevation(Double.parseDouble(x));
		    	    	

		  	    }
		rs.close();
		stmt.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}
	public Member getMember(String login){
		Statement stmt;
		Member p = null;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT * FROM member WHERE login='"+login+"';");
		    	   
		   while ( rs.next() ) {
			   
		   	   	p = new Member(login);
		    	    	String x = null;
		    	    	if ((x = rs.getString("mail"))!= null) p.setMail(x);
		    	    	if ((x = rs.getString("www"))!= null) p.setWWW(x);
		    	    	if ((x = rs.getString("birthday"))!= null) p.setBirthday(x);
		    	    	if ((x = rs.getString("joined"))!= null) p.setJoined(x);
		    	    	if ((x = rs.getString("description"))!= null) p.setDescription(x);
		  	    }
		rs.close();
		stmt.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return p;
	}
	
	
	
	
	
	
	
	
	

	
	//only id with names
	public List<Point> getPointsList(){
		List <Point> l = new LinkedList<Point>();
		Statement stmt;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT *" +
		    		" FROM public.point;"
		    	    );

		 
		   while ( rs.next() ) {
			   
		   	   	Point p = new Point((rs.getInt("point_id")), rs.getString("point_name"));
		    	l.add(p); 	

		  	    }
		rs.close();
		stmt.close();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
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
		   rs.close();
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}
	
	public List<Expedition> getExped(String attr){
		List<Expedition> l = new LinkedList<Expedition>();
		
		Statement stmt;
		String where = "";
		if (attr != null)where = "WHERE p.point_id = e.exped_aim AND "+attr;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT e.exped_id, e.exped_start, e.exped_end, e.exped_login, p.point_name, p.point_id "+
			"FROM public.expedition e, public.point p "+
            where+";"); 
 

		   
		  while ( rs.next() ) {
			    	  Expedition e = new Expedition(
			    			  rs.getInt("exped_id"), rs.getDate("exped_start"), rs.getDate("exped_end"),
			    			 rs.getString("point_name"),rs.getInt("point_id"), rs.getString("exped_login")); 	
			    	  l.add(e);
		  	    }
		   rs.close();
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}
	
	
	public List<Expedition> getSucExped(String login){
		List<Expedition> l = new LinkedList<Expedition>();
		
		Statement stmt;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT * "+
			"FROM expedition WHERE exped_login='"+login+"' AND exped_result='TRUE'");
 

		   
		   while ( rs.next() ) {
			    	  Expedition e = new Expedition(
			    			  rs.getInt("exped_id"), rs.getDate("exped_start"), rs.getDate("exped_end"),
			    			  rs.getBoolean("exped_result"), rs.getString("exped_login"), rs.getInt("exped_aim")); 	
			    	  l.add(e);
		  	    }
		   rs.close();
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<Plan> getPlan(String attr){
		List<Plan> l = new LinkedList<Plan>();
		
		Statement stmt;
		String where = "";
		if (attr != null)where = "WHERE "+attr;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT * "+
			"FROM public.plan "+
            where+";"); 
 

		   
		   while ( rs.next() ) {
			    	  Plan p = new Plan(
			    			  rs.getInt("plan_id"), rs.getString("plan_login"), rs.getInt("plan_point"));
			    	  String x;
			    	  if ((x = rs.getString("readiness"))!= null) p.setReadiness(x);
			    	  if ((x = rs.getString("plan_desc"))!= null) p.setDescription(x);
			    	  l.add(p);
		  	    }
		   rs.close();
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}
	
	public List<Post> getPostsList(String attr){
		List<Post> l = new LinkedList<Post>();
		
		Statement stmt;
		String where = "WHERE member_experience.exper_exped = expedition.exped_id AND member_experience.exper_post = post.post_id ";
		if (attr != null)where += " AND "+ attr;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT post.post_id, post.post_date, post.category, post.post_content, expedition.exped_login "+
			"FROM public.expedition, public.post, public.member_experience "+
            where+";"); 
 

		   
		   while ( rs.next() ) {
			    	  Post p = new Post(
			    			  rs.getInt("post_id"), rs.getDate("post_date"), rs.getString("category"),
			    			  rs.getString("post_content"), rs.getString("exped_login")); 	
			    	  l.add(p);
		  	    }
		   rs.close();
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}
	
	
	public void insertExpedition(Date start, Date end, boolean result, String login, int point){
	
		
		try {
			PreparedStatement stmt= connection.prepareStatement("INSERT INTO expedition (exped_start, exped_end, exped_result, exped_login, exped_aim) VALUES ( ?, ?,?,?,?)");
			stmt.setDate(1, start);
			stmt.setDate(2, end );
			stmt.setBoolean(3, result);
			stmt.setString(4, login);
			stmt.setInt(5, point);
			stmt.execute();


		   
		   
		  
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void insertPlan(String readiness, String login, int point, String notes){
	
		
		try {
			PreparedStatement stmt= connection.prepareStatement("INSERT INTO plan (plan_login, plan_point, readiness, plan_desc) VALUES ( ?,?,?::readiness_type,?)");
			stmt.setString(1, login);
			stmt.setInt(2, point);
			stmt.setString(3, readiness);
			stmt.setString(4, notes);
			stmt.execute();


		   
		   
		  
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void insertPost(String[] exped, String content, String login, Date date, String category ){
		
		try {
			PreparedStatement stmt= connection.prepareStatement("INSERT INTO post (post_date, category, post_content) VALUES ( ?, ?::post_type,?) RETURNING post_id");
			stmt.setDate(1, date);
			stmt.setString(2,category);
			stmt.setString(3, content);
			
			
			stmt.execute();
			ResultSet r = stmt.getResultSet();
			r.next();
			int postId = r.getInt(1);	
			stmt.close(); 
			
			
			
			stmt= connection.prepareStatement("INSERT INTO member_experience (exper_exped, exper_post) VALUES ( ?, ?);");
			for (String eId :exped){
				stmt.setInt(1, Integer.parseInt(eId));
				stmt.setInt(2, postId);
				stmt.execute();
				
			}
			

		   
		   
		  
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public List<Comment> getComment(String id){
		List<Comment> l = new LinkedList<Comment>();
		
		Statement stmt;
		
		try {
			stmt = connection.createStatement();
		    ResultSet rs = stmt.executeQuery("SELECT * "+
			"FROM member_comment WHERE comment_post='"+id+"'");
 

		   
		   while ( rs.next() ) {
			    	  Comment e = new Comment(
			    			  rs.getInt("comment_id"), rs.getDate("comment_date"), rs.getString("comment_content"),
			    			  rs.getString("comment_author"), rs.getInt("comment_post")); 	
			    	  l.add(e);
		  	    }
		   rs.close();
		   stmt.close(); 
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}

public void insertComment(int id, String author, String content){
		
		try {
			
			PreparedStatement stmt = connection.prepareStatement("INSERT INTO comment(comment_id,comment_date,comment_content,comment_author_commentpost)" + 
					"VALUES('"+id+"','"+author+"', '"+content+"',)'");
			stmt.setInt(1, id);
			stmt.setString(2,author);
			stmt.setString(3, content);
			
			
			stmt.execute();
			ResultSet r = stmt.getResultSet();
			r.next();
			stmt.close(); 
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateUser(String user, String mail, String www, String date, String description){
		Statement stmt;
		try {
			stmt = connection.createStatement();
			String attr = "mail='"+mail+
					"', www='"+www+"', description='"+description+"'";
			
			if (date != null){
				java.util.Date date1;
			try {
				date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
				attr+= ", birthday='"+date1+"' ";
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}
			stmt.executeUpdate("UPDATE member SET "+attr+" WHERE login='"+user+"';");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}