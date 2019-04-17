package progetto_Biblioteca.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import progetto_Biblioteca.servlet;

@WebServlet("/ProgettoBibliotecaServlet")

public class ProgettoBibliotecaServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ProgettoBibliotecaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		//così leggiamo i dati della form
		String cod=request.getParameter("cod");
		String nome=request.getParameter("nome");
		String bio=request.getParameter("bio");
		String link=request.getParameter("link");
		
		//Stampa dati in console Eclipse
		System.out.println(cod);
		System.out.println(nome);
		System.out.println(bio);
		System.out.println(link);
		
		//Pagina Web Responsive che mostra i dati
		PrintWriter out= response.getWriter();
		
		out.println("<!DOCTYPE html><html><head><title>Riepilogo dati utente</title></head><body>");
		out.println("<style type='text/css'>table{margin: auto;width: 20%;background-color: #fc5c65;padding: 20px;border: auto;height: 30%;font-family: fantasy;}</style>");
		out.println("<br><center>	Autore: "+nome+"</center><br><br><br><table><tbody><center>Il riepilogo dei dati</center><tr><td>Nome e Cognome: &nbsp;</td><td>"+nome+"&nbsp;</td></tr><tr><td>Codice:&nbsp;</td><td>"+cod+"&nbsp;</td></tr><tr><td>Biografia: &nbsp;</td><td>"+bio+"&nbsp;</td></tr><tr><td>Link:&nbsp;</td><td><a href="+link+"> "+link+"&nbsp;</td></tr></tbody></table>");
		out.println("</body></html>");
	}

	

}
