<%@page import="progetto_Biblioteca.bean.TblAutore" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	boolean autorePresente=false;
	int CodAut=0;
	String NomAut="";
	String BioAut="";
	String LinAut="";
	TblAutore lb=new TblAutore();
	lb=(TblAutore)request.getSession().getAttribute("Autore");
	if (lb != null){
		
		autorePresente=true;
		CodAut=lb.getCodAut();
		BioAut=lb.getBioAut();
		NomAut=lb.getNomAut();
		LinAut=lb.getLinAut();
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
        <li><a class="drop" href="#">Pages</a>
          <ul>
            <li><a href="pages/gallery.html">Gallery</a></li>
            <li><a href="pages/full-width.html">Full Width</a></li>
            <li><a href="pages/sidebar-left.html">Sidebar Left</a></li>
            <li><a href="pages/sidebar-right.html">Sidebar Right</a></li>
            <li><a href="pages/basic-grid.html">Basic Grid</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">Dropdown</a>
          <ul>
            <li><a href="#">Level 2</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
            <li><a href="#">Level 2</a></li>
          </ul>
        </li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
      </ul>
    </nav>
    
  </header>
</div>

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
	<h2 align="center"><font><strong>Lista degli autori</strong></font></h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
	<tr>
	
	</tr>
	<tr bgcolor="#A52A2A">
	<td><b>Codice</b></td>
	<td><b>Nome</b></td>
	<td><b>Biografia</b></td>
	<td><b>Link</b></td>
	</tr>
<%
	try{ 
	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM tblautore";
	
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>
	<tr bgcolor="#DEB887">
	
	<td><%=resultSet.getString("CodAut") %></td>
	<td><%=resultSet.getString("NomAut") %></td>
	<td><%=resultSet.getString("BioAut") %></td>
	<td> <a href="<%=resultSet.getString("LinAut") %>"> <%=resultSet.getString("LinAut") %></td>
	
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




