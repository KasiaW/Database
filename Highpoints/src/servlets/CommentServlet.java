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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/CommentServlet")

public class CommentServlet extends HttpServlet  {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public CommentServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 
			/*PrintWriter writer = response.getWriter();
			writer.println("test");
			writer.close();*/
			
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} 
			
			HttpSession session = request.getSession(true); 
			
			String content = request.getParameter("SubmitComment");
			String author = request.getParameter("author");
			int idPost = Integer.parseInt(request.getParameter("idPost"));

			try {
			
			Comment newComment = new Comment(idPost, content, author);
			 
			if ((author.length()>=0) && (content.length()!=0)){		 
				
				
				newComment.add();
						 
						 PrintWriter out = response.getWriter();
							out.print("<html><head></head><body><h3>YOUR COMMENT WAS SUCCESSFULLY SUBMITTED!</h3></body></html>");
							
			} else{ 
				
				PrintWriter out = response.getWriter();
				out.print("<html><head></head><body><h4 style=font-family:verdana;color:red;font-size:20px;> " +
										"Something went wrong!</h4>");
				out.print("<h3 style=font-family:verdana;color:red;>The text field might be empty</h3></body></html>");
				}
			} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();} catch (ParseException e) {
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
