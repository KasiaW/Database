package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import business.User;
import dati.UserIO;

/**
* Servlet implementation class for Servlet: SimpleController
*
*/
public class SimpleController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet
{
  /* (non-Java-doc)
   * @see javax.servlet.http.HttpServlet#HttpServlet()
   */
  public SimpleController()
  {
    super();
  }
  
  /* (non-Java-doc)
   * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    String nome = request.getParameter("nome");
    String cognome = request.getParameter("cognome");
    String eta = request.getParameter("eta");

    User user = new User();
    user.setNome(nome);
    user.setCognome(cognome);
    user.setEta(eta);
    // Ricordarsi di creare la directory etc specificata!
    UserIO.addItem( user, "./webapps/MySimpleWebApplication/WEB-INF/etc/users.txt");
    
    HttpSession session = request.getSession();
    session.setAttribute("user", user);
    
    RequestDispatcher dispatcher;
    dispatcher = getServletContext().getRequestDispatcher(
          "/ShowUser.jsp");
    dispatcher.forward(request,response);

  }
  
  /* (non-Java-doc)
   * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    this.doGet(request, response);
  }
} 