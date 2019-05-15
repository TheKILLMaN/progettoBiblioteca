package Query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Bean.AutoreBean;
import Bean.CategoriaBean;
import Bean.DescrizioneBibliograficaBean; 

public class Sql {

		// Parametri di accesso al database
		private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
		private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/dbbiblioteca?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		private static final String DB_USER = "root";
		private static final String DB_PASSWORD = "";


		public static Connection getDBConnection() throws Exception {

			// Funzione per creare la connessione
			System.out.println("------------- MySQL JDBC Connection -------------");
			Connection dbConnection = null;

			// Carico il driver
			try {
				Class.forName(DB_DRIVER);
			}
			catch (ClassNotFoundException e){
				System.out.println("ERROR loading MySQL JDBC Driver");
				throw new Exception(e.getMessage());
			}

			// Apro la connessione
			try {
				dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
				System.out.println("MySQL connection success");
			}
			catch (SQLException e){
				System.out.println("MySQL connection failed");
				throw new Exception(e.getMessage());
			}

			// Ritorno l'oggetto creato
			return dbConnection;
		}// End getDBConnection()
		
		public ArrayList<AutoreBean> SelezionaAutore() throws Exception{
			
		Statement stmt = null;
		Connection conn = null;

		try {
			//Creo la connessione al database
			conn = getDBConnection();
			//Disattivo auto commit al database: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			//Seleziono tutti i campi presenti nella tabella "tblautore" 
			String sql = "SELECT * FROM `tblautore`"; 
				
			ResultSet elenco = stmt.executeQuery(sql); 
			
			//Dichiarazione di un ArrayList
			ArrayList<AutoreBean>autori = new ArrayList<AutoreBean>();
						
			while(elenco.next())
			{
				AutoreBean autore = new AutoreBean(); 
				autore.setBioAut(elenco.getString("BioAut")); 
				autore.setCodAut(elenco.getInt("CodAut")); 
				autore.setLinAut(elenco.getString("LinAut")); 
				autore.setNomAut(elenco.getString("NomAut")); 
				autori.add(autore); 
			}
				
			System.out.println("MySQL SelezionaAutore() confirmed");
			return (ArrayList<AutoreBean>)autori; 
		}
			catch (SQLException e) {
				//Se ricevo un errore faccio il rollback, per garantire l'integrità dei dati 
				System.out.println("MySQL SelezionaAutore() failed");
				if(conn != null) {
					conn.rollback();
				}
				throw new Exception(e.getMessage());
			}
			finally {
				//Chiusura della connessione
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}
		}
		
		public ArrayList<DescrizioneBibliograficaBean> SelezionaLibriPerAutore(int CodAut) throws Exception{
			
		Statement stmt = null;
		Connection conn = null;

		try {
			//Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al database: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			//Vado a selezionare i campi della tabella "tbldescrizionebibliogafica" che hanno il codice autore interressato
			String sql = "SELECT * FROM tblbiblio INNER JOIN tblautore ON tblautore.CodAut=tblbiblio.CodAut WHERE tblautore.CodAut= " +CodAut;
				
			ResultSet elenco = stmt.executeQuery(sql); 
				
			//Dichiarazione dell'array list 
			ArrayList<DescrizioneBibliograficaBean>libri = new ArrayList<DescrizioneBibliograficaBean>();
					
			while(elenco.next())
			{
				DescrizioneBibliograficaBean libro = new DescrizioneBibliograficaBean(); 
				libro.setCodAut(elenco.getInt("CodAut"));
				libro.setCodCat(elenco.getInt("CodCat"));
				libro.setCodDesBib(elenco.getInt("CodDesBib"));
				libro.setDesLib(elenco.getString("DesLib"));
				libro.setLinLib(elenco.getString("Linlib"));
				libro.setTitLib(elenco.getString("TitLib"));
				libro.setNomAut(elenco.getString("NomAut")); 
				libri.add(libro); 
			}
				
			System.out.println("MySQL SelezionaLibriPerAutore() confirmed");
			return (ArrayList<DescrizioneBibliograficaBean>)libri; 
		}
			catch (SQLException e) {
				//Se ricevo un errore faccio il rollback, per garantire l'integrità dei dati 
				System.out.println("MySQL SelezionaLibriPerAutore() failed");
				if(conn != null) {
					conn.rollback();
				}
				throw new Exception(e.getMessage());
			}
			finally {
				// Chiudo la connessione
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}
		}
		
		public ArrayList<CategoriaBean> SelezionaGenere() throws Exception{
			
			Statement stmt = null;
			Connection conn = null;

			try {
			//Creo la connessione al database
			conn = getDBConnection();
			//Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			String sql = "SELECT * FROM `tblcat`"; //Stringa sql 
				
			ResultSet elenco = stmt.executeQuery(sql); 
				
			ArrayList<CategoriaBean>categorie = new ArrayList<CategoriaBean>();
						
			while(elenco.next())
			{
				CategoriaBean categoria = new CategoriaBean(); 
				categoria.setCodCat(elenco.getInt("CodCat")); 
				categoria.setNomeCat(elenco.getString("NomeCat")); 
				categorie.add(categoria); 
			}
				
				System.out.println("MySQL SelezionaGenere() confirmed");
				return (ArrayList<CategoriaBean>)categorie; 
			}
			catch (SQLException e) {
				// Se ricevo un errore faccio il rollback
				System.out.println("MySQL SelezionaGenere() failed");
				if(conn != null) {
					conn.rollback();
				}
				throw new Exception(e.getMessage());
			}
			finally {
				// Chiudo la connessione
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}
		}
		
		public ArrayList<DescrizioneBibliograficaBean> SelezionaLibriPerGenere(int CodCat) throws Exception{
			
		Statement stmt = null;
		Connection conn = null;

		try {
			//Creo la connessione al database
			conn = getDBConnection();
			//Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			String sql = "SELECT * FROM tblbiblio INNER JOIN tblcat ON tblcat.CodCat=tblbiblio.CodCat WHERE tblbiblio.CodCat= " +CodCat;
				
			ResultSet elenco = stmt.executeQuery(sql); 
				
			ArrayList<DescrizioneBibliograficaBean>libri = new ArrayList<DescrizioneBibliograficaBean>();
						
			while(elenco.next())
			{
				DescrizioneBibliograficaBean libro = new DescrizioneBibliograficaBean(); 
				libro.setCodAut(elenco.getInt("CodAut")); 
				libro.setCodCat(elenco.getInt("CodCat"));
				libro.setCodDesBib(elenco.getInt("CodDesBib"));
				libro.setDesLib(elenco.getString("DesLib"));
				libro.setLinLib(elenco.getString("Linlib"));
				libro.setTitLib(elenco.getString("TitLib"));
				libro.setNomeCat(elenco.getString("NomeCat"));
				libri.add(libro); 
			}
				
				System.out.println("MySQL SelezionaLibriPerGenere() confirmed");
				return (ArrayList<DescrizioneBibliograficaBean>)libri; 
			}
			catch (SQLException e) {
				// Se ricevo un errore faccio il rollback
				System.out.println("MySQL SelezionaLibriPerGenere() failed");
				if(conn != null) {
					conn.rollback();
				}
				throw new Exception(e.getMessage());
			}
			finally {
				// Chiudo la connessione
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}
		}
		
}
