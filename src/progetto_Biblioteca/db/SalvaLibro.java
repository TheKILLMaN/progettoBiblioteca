package progetto_Biblioteca.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


import progetto_Biblioteca.bean.TblBiblio;

public class SalvaLibro {
	
	
	private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String DB_CONNECTION = 
			"jdbc:mysql://localhost:3306/dbbiblioteca?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "";
	

private static Connection getDBConnection() throws Exception{
		
		System.out.println("Connessione");
		Connection dbConnection = null;
		
		try
		{
			Class.forName(DB_DRIVER);
		}
		catch (ClassNotFoundException e)
		{
			System.out.println("Errore Driver non trovato");
			throw new Exception(e.getMessage());
		}
		
		try
		{
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
			System.out.println("Connessione al database stabilita!");
		}
		catch (SQLException e)
		{
			System.out.println("Connessione al database fallita!");
			throw new Exception(e.getMessage());
		}
		return dbConnection;
	}
	
	
	public void insertLibro(TblBiblio TBLBIBLIO) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		
		
		try{

			
			conn=getDBConnection();

			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			
			String insertLibro="INSERT INTO tblbiblio(CodAut,TitLib,CodCat,DesLib,LinLib) VALUES('"+TBLBIBLIO.getCodAut()+"','"+TBLBIBLIO.getTitLib()+"','"+TBLBIBLIO.getCodCat()+"','"+TBLBIBLIO.getDesLib()+"','"+TBLBIBLIO.getLinLib()+"')";  
			
			stmt.executeUpdate(insertLibro);
			
			conn.commit();
			
		}
		
		catch(Exception ex){
			
			if (conn != null)
			{
				conn.rollback();
			}
			throw new Exception (ex);
		}
		finally
		{
			if (stmt != null)
			{
				stmt.close();
			}
			if (conn != null)
			{
				conn.close();
			}
		}
		
		
		
	}
	

	public SalvaLibro() {
		// TODO Auto-generated constructor stub
	}

}
