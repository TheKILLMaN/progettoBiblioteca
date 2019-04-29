package progetto_Biblioteca.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import progetto_Biblioteca.db.SalvaCategoria;
import progetto_Biblioteca.db.SalvaAutore;
import progetto_Biblioteca.db.SalvaLibro;
import progetto_Biblioteca.bean.TblCategoria;
import progetto_Biblioteca.bean.TblBiblio;
import progetto_Biblioteca.bean.TblAutore;

@WebServlet("/BiblioServlet")

public class BiblioServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3350239039931059357L;



	public BiblioServlet() {
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
		
		
		String whatsend=request.getParameter("whatsend");
		
		
		// ################################# 	NUOVO LIBRO IN SESSIONE   ##################################//
		
		if (whatsend.equals("TblBiblio")){
			
			
			//così leggiamo i dati della form TblBiblio
			
			//int CodDesBib=Integer.parseInt(request.getParameter("CodDesBib"));
			int CodAut=Integer.parseInt(request.getParameter("CodAut"));
			String TitLib2=request.getParameter("TitLib");
			int CodCat=Integer.parseInt(request.getParameter("CodCat"));
			String DesLib2=request.getParameter("DesLib");
			String LinLib2=request.getParameter("LinLib");
			
			
			
			///////////	 SOSTITUZIONE APOSTROFI!!!	/////////////////////////////////////////////////////////
			// Per funzionare ogni singolo apostrofo deve essere raddoppiato! ////////////////////////////////
			
			
			String rp = "''";									// Valore con sui si sostituisce, cioè doppi apostrofi
			String TitLib=TitLib2.replaceAll("'",rp);			// La funzione rimpiazza ogni apostrofo singolo, con quelli doppi
			String DesLib=DesLib2.replaceAll("'",rp);
			String LinLib=LinLib2.replaceAll("'",rp);
			
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			TblBiblio biblio=new TblBiblio();
			
			
			//biblio.setCodDesBib(CodDesBib);
			biblio.setCodAut(CodAut);
			biblio.setTitLib(TitLib);
			biblio.setCodCat(CodCat);
			biblio.setDesLib(DesLib);
			biblio.setLinLib(LinLib);
			
			
			ArrayList<TblBiblio> biblioDes=new ArrayList<TblBiblio>();
			biblio.setBiblioDes(biblioDes);
			
			
			
			request.getSession().removeAttribute("TBLBIBLIO");
			request.getSession().setAttribute("TBLBIBLIO",biblio);
			
			
			ServletContext sc=request.getSession().getServletContext();
			RequestDispatcher rd=sc.getRequestDispatcher("/RiepilogoLib.jsp");
			rd.forward(request, response);
			
			
			//Stampa dati in console Eclipse
			//System.out.println(CodDesBib);
			System.out.println(CodAut);
			System.out.println(TitLib);
			System.out.println(CodCat);
			System.out.println(DesLib);
			System.out.println(LinLib);
			
			//Pagina Web Responsive che mostra i dati
			PrintWriter out= response.getWriter();
			
			out.println("<!DOCTYPE html><html><head><title>Riepilogo dati utente</title></head><body>");
			out.println("<style type='text/css'>table{margin: auto;width: 20%;background-color: #fc5c65;padding: 20px;border: auto;height: 30%;font-family: fantasy;}</style>");
			out.println("<br><center>	Titolo: "+TitLib+"</center><br><br><br><table><tbody><center>Il riepilogo dei dati</center><tr><td>Autore: &nbsp;</td><td>"+CodAut+"&nbsp;</td></tr><tr><td>Titolo:&nbsp;</td><td>"+TitLib+"&nbsp;</td></tr><tr><td>Categoria: &nbsp;</td><td>"+CodCat+"&nbsp;</td></tr><tr><td>Descrizione:&nbsp;</td><td>"+DesLib+"&nbsp;</td></tr><tr><td>Link:&nbsp;</td><td><a href="+LinLib+"> "+LinLib+"&nbsp;</td></tr></tbody></table>");
			out.println("</body></html>");
		
		}
		
		
		// ################################# 	NUOVO LIBRO IN DATABASE   ##################################//
		
				else if (whatsend.equalsIgnoreCase("NewLibrodb")){
					

					TblBiblio fl = new TblBiblio();
					fl=(TblBiblio)request.getSession().getAttribute("TBLBIBLIO");
					

					
					SalvaLibro sl=new SalvaLibro();
					
					try{
						sl.insertLibro(fl);
						
						response.sendRedirect("/progettoBiblioteca/formTblBiblio.jsp");
						
						request.getSession().invalidate();		//	CANCELLAZIONE DATI DELLA SESSIONE
						
					} catch (Exception e){
						
						e.printStackTrace();
						
						
					}
					
					
				}
		
		
		
		// ################################# 	NUOVO AUTORE IN SESSIONE   ##################################//
		
		else if (whatsend.equals("nuovoautoresession")){
			
			
			//così leggiamo i dati della form TblAutore
			
			//int CodAut=Integer.parseInt(request.getParameter("CodAut"));
			String NomAut2=request.getParameter("NomAut");
			String BioAut2=request.getParameter("BioAut");
			String LinAut2=request.getParameter("LinAut");
			
			
			
			
			///////////	 SOSTITUZIONE APOSTROFI!!!	/////////////////////////////////////////////////////////
			// Per funzionare ogni singolo apostrofo deve essere raddoppiato! ////////////////////////////////
			
			
			String rp = "''";									// Valore con sui si sostituisce, cioè doppi apostrofi
			String NomAut=NomAut2.replaceAll("'",rp);			// La funzione rimpiazza ogni apostrofo singolo, con quelli doppi
			String BioAut=BioAut2.replaceAll("'",rp);
			String LinAut=LinAut2.replaceAll("'",rp);
			
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			
			TblAutore autore=new TblAutore();
			
			
			//autore.setCodAut(CodAut);
			autore.setNomAut(NomAut);
			autore.setBioAut(BioAut);
			autore.setLinAut(LinAut);
			
			
			/*ArrayList<TblAutore> Bioaut=new ArrayList<TblAutore>();
			autore.setBioAut(BioAut);
			*/
			
			ArrayList<TblBiblio> databaseArrayList = new ArrayList<TblBiblio>();

			request.setAttribute("databaseList", databaseArrayList);    
			
			
			request.getSession().removeAttribute("Autore");
			request.getSession().setAttribute("Autore",autore);
			
			
			ServletContext sc=request.getSession().getServletContext();
			RequestDispatcher rd=sc.getRequestDispatcher("/Riepilogo.jsp");
			rd.forward(request, response);
			
			
			//Stampa dati in console Eclipse
			//System.out.println(CodAut);
			System.out.println(NomAut);
			System.out.println(BioAut);
			System.out.println(LinAut);
			
			//Pagina Web Responsive che mostra i dati
			PrintWriter out= response.getWriter();
			
			out.println("<!DOCTYPE html><html><head><title>Riepilogo dati utente</title></head><body>");
			out.println("<style type='text/css'>table{margin: auto;width: 20%;background-color: #fc5c65;padding: 20px;border: auto;height: 30%;font-family: fantasy;}</style>");
			out.println("<br><center>	Codice: "+NomAut+"</center><br><br><br><table><tbody><center>Il riepilogo dei dati</center><tr><td>Autore: &nbsp;</td><td>"+NomAut+"&nbsp;</td></tr><tr><td>Biografia:&nbsp;</td><td>"+BioAut+"&nbsp;</td></tr><tr><td>Link:&nbsp;</td><td><a href="+LinAut+"> "+LinAut+"&nbsp;</td></tr></tbody></table>");
			out.println("</body></html>");
			
			
		}
		
		// ################################# 	NUOVO AUTORE IN DATABASE   ##################################//
		
		else if (whatsend.equalsIgnoreCase("NewAutoredb")){
			

			TblAutore fl = new TblAutore();
			fl=(TblAutore)request.getSession().getAttribute("Autore");
			

			
			SalvaAutore sl=new SalvaAutore();
			
			try{
				sl.insertAutore(fl);
				
				response.sendRedirect("/progettoBiblioteca/formTblAutore.jsp");
				
				request.getSession().invalidate();		//	CANCELLAZIONE DATI DELLA SESSIONE
				
			} catch (Exception e){
				
				e.printStackTrace();
				
				
			}
			
			
		}
		
	//###################################################################################################//
		
		
	// ################################# 	NUOVA CATEGORIA IN SESSIONE   ##################################//
	
			else if (whatsend.equals("nuovacetgoriasession")){
				
				
				//così leggiamo i dati della form TblAutore
				
				//int CodCat=Integer.parseInt(request.getParameter("CodCat"));
				String NomeCat2=request.getParameter("NomeCat");
				
				
				
				
				///////////	 SOSTITUZIONE APOSTROFI!!!	/////////////////////////////////////////////////////////
				// Per funzionare ogni singolo apostrofo deve essere raddoppiato! ////////////////////////////////
				
				
				String rp = "''";									// Valore con sui si sostituisce, cioè doppi apostrofi
				String NomeCat=NomeCat2.replaceAll("'",rp);			// La funzione rimpiazza ogni apostrofo singolo, con quelli doppi

				
				
				/////////////////////////////////////////////////////////////////////////////////////////////////////
				
				
				
				TblCategoria categoria=new TblCategoria();
				
				
				//autore.setCodAut(CodAut);
				categoria.setNomeCat(NomeCat);
				
				
				/*ArrayList<TblAutore> Bioaut=new ArrayList<TblAutore>();
				autore.setBioAut(BioAut);
				*/
				
				
				request.getSession().removeAttribute("Categoria");
				request.getSession().setAttribute("Categoria",categoria);
				
				
				ServletContext sc=request.getSession().getServletContext();
				RequestDispatcher rd=sc.getRequestDispatcher("/RiepilogoCat.jsp");
				rd.forward(request, response);
				
				
				//Stampa dati in console Eclipse
				//System.out.println(CodAut);
				System.out.println(NomeCat);
				
				//Pagina Web Responsive che mostra i dati
				PrintWriter out= response.getWriter();
				
				out.println("<!DOCTYPE html><html><head><title>Riepilogo dati utente</title></head><body>");
				out.println("<style type='text/css'>table{margin: auto;width: 20%;background-color: #fc5c65;padding: 20px;border: auto;height: 30%;font-family: fantasy;}</style>");
				out.println("<br><center>	Codice: "+NomeCat+"</center><br><br><br><table><tbody><center>Il riepilogo dei dati</center><tr><td>Autore: &nbsp;</td><td>"+NomeCat+"&nbsp;</td></tr></tbody></table>");
				out.println("</body></html>");
				
				
			}
			
			// ################################# 	NUOVA CATEGORIA IN DATABASE   ##################################//
			
			else if (whatsend.equalsIgnoreCase("NewCatdb")){
				

				TblCategoria fl = new TblCategoria();
				fl=(TblCategoria)request.getSession().getAttribute("Categoria");
				

				
				SalvaCategoria sl=new SalvaCategoria();
				
				try{
					sl.insertCategoria(fl);
					
					response.sendRedirect("/progettoBiblioteca/formTblCategoria.jsp");
					
					request.getSession().invalidate();		//	CANCELLAZIONE DATI DELLA SESSIONE
					
				} catch (Exception e){
					
					e.printStackTrace();
					
					
				}
				
				
			}
			
		//###################################################################################################//
		
	}
	
	

}
