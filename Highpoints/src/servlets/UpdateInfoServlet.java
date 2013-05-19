package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
	
		try {
		 
		 
		 HttpSession session = request.getSession(true); 
		 
		 String userName = (session.getAttribute("currentSessionUser")).toString();
		 String mail = request.getParameter("mail1");
		 String www = request.getParameter("www1");
		
			
		 String date = request.getParameter("bd1");
		 
	
		 String description = request.getParameter("de");
		 
	
		
		 
		  UpdateInfo info = new UpdateInfo(userName,mail,www,date,description); 
		 
		  
		  info.update();
		  
		  PrintWriter out = response.getWriter();
			
			out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
					"INFORMATION CORRECTLY CHANGED!!!</h4>");  
			out.print("<a href=pointsList.jsp> Go to the home!</a>");
			
					
	
					 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 	
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	
		
	}


