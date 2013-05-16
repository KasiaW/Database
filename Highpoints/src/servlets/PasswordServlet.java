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
 * Servlet implementation class PasswordServlet
 */
@WebServlet("/PasswordServlet")
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordServlet() {
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
		 String passwordOld = request.getParameter("de");
		 String newPass1 = request.getParameter("new");
		 String newPass2 = request.getParameter("new1");
		
		 
		  Password password = new Password(userName,passwordOld, newPass1); 
		 
		 if (password.isValid() == false){
			 PrintWriter out = response.getWriter();
			
				out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
						"The old password inserted is incorrent. PLEASE RETRY</h4>");  
				out.print("<a href=changePassword.jsp> Go to change password page </a></body></html>");
			 
		 }
		  
		  
		
		 if(password.isValid() && (newPass1.equals(newPass2) == false)){
		 
			 PrintWriter out = response.getWriter();
				out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
						"The inserted passwords don't correspond!!!!. PLEASE RETRY</h4>");  
				out.print("<a href=changePassword.jsp> Go to change password page </a></body></html>");
	
				}
					
		 if(password.isValid() && (newPass1.equals(newPass2))){
			 password.update();
			 PrintWriter out = response.getWriter();
				out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
						"The password has been succesfully changed!!!</h4>");  
				out.print("<a href=index21.jsp> Go to the home page </a></body></html>");
	
				}
					
	
					 
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
