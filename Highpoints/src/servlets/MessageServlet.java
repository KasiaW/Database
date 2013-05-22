package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
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
		 String addressee = request.getParameter("addressee");
		 String title = request.getParameter("title");
		 String message = request.getParameter("message");
		
		 
		 Message message1 = new Message(userName,addressee, title,message); 
		
		 
		 
		 if((addressee.length() == 0 || title.length()==0) || message.length()==0){
			 PrintWriter out = response.getWriter();
				
				out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
						"You haven't filled the compulsory fields! PLEASE RETRY</h4>");  
				out.print("<a href=newMessage.jsp> Go to SEND NEW MESSAGE page </a></body></html>"); }
		 
		 
		 
		
			 
				else{
		  
		 
					 if (message1.validMember() == false){
						 PrintWriter out = response.getWriter();
						
							out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
									"There isn't any member with that name. PLEASE RETRY</h4>");  
							out.print("<a href=newMessage.jsp> Go to SEND NEW MESSAGE page </a></body></html>");}
			 
		 
		 
			 else{
				 message1.insert();
		 PrintWriter out = response.getWriter();
			
			out.print("<html><head></head><body><h4 style=font-family:verdana;font-size:20px;> " +
					"Your message has been correctly sent to "+addressee+" </h4>");  
			
		 
		 
			 }}
					 
			} catch (SQLException e) {
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
