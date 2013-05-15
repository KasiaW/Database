package servlets;


import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			
		 Login user = new Login(request.getParameter("un"),request.getParameter("pw")); 
		 
		
			if (user.isValid()){
				 HttpSession session = request.getSession(true); 
				 
				 session.setAttribute("currentSessionUser",request.getParameter("un")); 
				 response.sendRedirect("index21.jsp"); //logged-in page 
			}
				
				 else{ response.sendRedirect("failNew.jsp"); //error page 
				 } 
				 }
				 
				 
				 
				 
			 
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		PrintWriter out = response.getWriter();
		out.print("<html><head></head><body>" +  request.getParameter("un"));
		out.print("</body></html>");*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	
	
}
