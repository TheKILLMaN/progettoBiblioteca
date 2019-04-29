<%@page import="progetto_Biblioteca.bean.TblBiblio" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

	<style type='text/css'>
			table{
			margin: auto;
			width: 20%;
			background-color: rgba(221, 73, 73,1);
			padding: 20px;
			border: auto;
			height: 30%;
			}
	</style>
	
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<title>Biblioteca | Autori</title>
</head>
<body id="top">

<div class="bgded overlay" style="background-image: url('images/demo/backgrounds/01.png');">

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



<%
	String id = request.getParameter("CodAut");
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

<br>
	<h2 align="center"><font><strong>Lista dei libri</strong></font></h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>

	
	</tr>
	<tr bgcolor="#A52A2A">
	<td><b>Codice</b></td>
	<td><b>Autore</b></td>
	<td><b>Titolo</b></td>
	<td><b>Categoria</b></td>
	<td><b>Descrizione</b></td>
	<td><b>Link</b></td>
	</tr>
<%
	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="(SELECT CodDesBib,NomAut,TitLib,CodCat,DesLib,LinLib FROM tblbiblio INNER JOIN tblautore ON tblautore.CodAut=tblbiblio.CodAut)";
	
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>
	<tr bgcolor="#DEB887">
	

		<td><%=resultSet.getString("CodDesBib") %></td>
		<td><%=resultSet.getString("NomAut") %></td>
		<td><%=resultSet.getString("TitLib") %></td>
		<td><%=resultSet.getString("CodCat") %></td>
		<td><%=resultSet.getString("DesLib") %></td>
		<td> <a href="<%=resultSet.getString("LinLib") %>"> <%=resultSet.getString("LinLib") %></td>
	
	</tr>
	
<% 
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	}
%>
</table>

</body>
</html>




