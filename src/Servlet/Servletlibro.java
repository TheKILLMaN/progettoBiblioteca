package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servletlibro
 */
@WebServlet("/Servletlibro")
public class Servletlibro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servletlibro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String whatsend = request.getParameter("whatsend"); //Mi arriva il contenuto del campo whatsend 
		//Caso della ricerca del libro in base all'autore 
		if(whatsend.equalsIgnoreCase("RicercaAutore")){ //Andiamo a leggere i valori della sessione 
			//Lettura dei valori dal form
			int CodAut = Integer.parseInt(request.getParameter("autore"));
			request.getSession().removeAttribute("autore");
			request.getSession().setAttribute("autore", CodAut);
			ServletContext sc= request.getSession().getServletContext();
			RequestDispatcher rd= sc.getRequestDispatcher("/LibriA.jsp");
			rd.forward(request, response);
		}
		
		//Caso della ricerca del libro in base al genere 
		if(whatsend.equalsIgnoreCase("RicercaGenere")){ //Andiamo a leggere i valori della sessione 
			int CodCat = Integer.parseInt(request.getParameter("genere"));
			request.getSession().removeAttribute("genere");
			request.getSession().setAttribute("genere", CodCat);
			ServletContext sc= request.getSession().getServletContext();
			RequestDispatcher rd= sc.getRequestDispatcher("/LibriG.jsp");
			rd.forward(request, response);
		}
	}
}
