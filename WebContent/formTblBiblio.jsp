<%@page import="progetto_Biblioteca.bean.TblBiblio" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
	String id = request.getParameter("CodCat");
	String driverName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "dbbiblioteca?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	String userId = "root";
	String password = "";
	

	
	try {
	Class.forName(driverName);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>

<%

	boolean libroPresente=false;
	//int CodDesBib=0;
	int CodAut=0;
	String TitLib="";
	int CodCat=0;
	String DesLib="";
	String LinLib="";
	TblBiblio lb=new TblBiblio();
	lb=(TblBiblio)request.getSession().getAttribute("TBLBIBLIO");
	if (lb != null){
		
		libroPresente=true;
		

		//CodDesBib=lb.getCodDesBib();
		CodAut=lb.getCodAut();
		TitLib=lb.getTitLib();
		CodCat=lb.getCodCat();
		DesLib=lb.getDesLib();
		LinLib=lb.getLinLib();
		
	}
%>



<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<title>Biblioteca | Nuovo Libro</title>
</head>
<body>

<div class="bgded overlay" style="background-image: url('images/demo/backgrounds/01.png');">

	<style type="text/css">
		
		form{
			margin: auto;
			width: 20%;
			background-color: rgba(221, 73, 73,1);
			padding: 20px;
			border: auto;
			height: 30%;
			
		}



	</style>
	
	
<!-- ///////////////////////////////////////	NAV BAR  ///////////////////////////////////////////// -->

<div class="wrapper row6">
  <header id="header" class="hoc clear"> 
  
    <div id="logo" class="fl_left">
      <h1><a href="index.html" id="home">Home</a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="index.html">Home</a></li>
        <li><a class="drop" href="#">Pagine</a>
          <ul>
            <li><a href="pages/gallery.html">Galleria</a></li>
            <li><a href="pages/full-width.html">Full Width</a></li>
            <li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
            <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
            <li><a href="pages/basic-grid.html">Basic Grid</a></li>
          </ul>
        </li>
        
        <li><a class="drop" href="#">Ricerca</a>
          <ul>
            <li><a href="Autore.jsp">Per Autore</a></li>
            <li><a href="Genere.jsp">Per Genere</a></li>
            <li><a href="Titolo.jsp">Per Titolo</a></li>
           
          </ul>
        </li>
        
        <li><a class="drop" href="#">Lista</a>
          <ul>
            <li><a href="LibriPresenti.jsp">Libri</a></li>
            <li><a href="AutoriPresenti.jsp">Autori</a></li>
            <li><a href="CategoriePresenti.jsp">Categorie</a></li>
           
          </ul>
        </li>
        
        <li><a class="drop" href="#">Nuovo</a>
          <ul>
            <li><a href="formTblBiblio.jsp">Libro</a></li>
            <li><a href="formTblAutore.jsp">Autore</a></li>
            <li><a href="formTblCategoria.jsp">Categoria</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    
  </header>
</div>


<!-- /////////////////////////////////////////////////////////////////////////////////////////////   -->
	

<!-- <form name="dati" action="/company_management/FirstServlet" method="POST"> -->

<form name="dati" action="/progettoBiblioteca/BiblioServlet" name="libroform" method="POST">


<center><h3>Inserisci i dati del libro</h3><br>


   		Nome Autore
   		<!--<br><input type="text" name="CodAut" placeholder="Codice">-->
   		
   		<select name="CodAut" style="color:#000000;">
  
  
  <%
		try{ 
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM tblautore";
		
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
  		
  	
  		
		<option value="<%=resultSet.getString("CodAut") %>"><%=resultSet.getString("NomAut") %>
			
    
    <% 
			}
			
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
		
		</select>
   		
   		
  <br><br>
  		Titolo<br><input type="text" name="TitLib" placeholder="Nome">
  <br><br>
  		<!--  Codice Categoria<br><input type="text" name="CodCat" placeholder="Codice">-->

  
  Genere: 
		  	<select name="CodCat" style="color:#000000;">
  
  
  <%
		try{ 
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM tblcat";
		
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
  		
  	
  		
		<option value="<%=resultSet.getString("CodCat") %>"><%=resultSet.getString("NomeCat") %>
			
    
    <% 
			}
			
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
		
		</select>
		
		  <br><br>
		
  		Descrizione<br><textarea type="text" name="DesLib" placeholder="Biografia"></textarea>
  <br><br>
  
  		link<br><input type="text" name="LinLib" placeholder="Link">
  <br><br>
  
  
  <input name="whatsend" value="TblBiblio" type="hidden">


  <br><br>
  <input type="submit" value="Inserisci"  class="inverse2">
  <input type="reset" value="Cancella"  class="inverse2">
  
  
<form method="post" action="BiblioServlet" name="Savedb">

	<input type="hidden" name="whatsend" value="NewLibdb">
	
	<% if(libroPresente==true){ %>
	
	<!--  <input type="submit" value="Aggiungi libro in DB"> -->		<!-- Per aggiungere un nuovo bottone, devo creare una nuova form -->

	<% } %>

</form>
		
		
</center>
</form>
</div>
</body>
</html>