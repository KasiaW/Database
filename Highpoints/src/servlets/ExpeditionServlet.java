package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import engine.Core;

/**
 * Servlet implementation class ExpeditionServlet
 */
@WebServlet("/ExpeditionServlet")
public class ExpeditionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Validation
		
		Date start = Date.valueOf(request.getParameter("start"));
		Date end= Date.valueOf(request.getParameter("end"));
		boolean result = Boolean.parseBoolean(request.getParameter("result"));
		String login = request.getParameter("login");
		int point  = Integer.parseInt(request.getParameter("point"));
		Core.getDB().insertExpedition(start, end, result, login, point);
		response.sendRedirect("expedition.jsp");
	}

}
