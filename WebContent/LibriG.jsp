<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Query.Sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Bean.DescrizioneBibliograficaBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Biblioteca | Rcerca per genere</title>
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

<br>
	<h2 align="center"><font><strong>Libri per Genere</strong></font></h2>

	<table>
	
	<tr bgcolor="#A52A2A">
		<td><b>Categoria</b></td>
		<td><b>Titolo Libro</b></td>
		<td><b>Descrizione</b></td>
	</tr>
	
	
	<% 
		ArrayList<DescrizioneBibliograficaBean> libro; 
		Sql db = new Sql();
		libro = db.SelezionaLibriPerGenere(Integer.parseInt(request.getSession().getAttribute("genere").toString())); 
		
		for(int i=0; i<libro.size(); i++)
		{
			String DesLib = libro.get(i).getDesLib(); 
			String LinLib = libro.get(i).getLinLib();
			String TitLib = libro.get(i).getTitLib();
			int CodAut = libro.get(i).getCodAut(); 
			int CodCat = libro.get(i).getCodCat();
			int CodDesBib = libro.get(i).getCodDesBib();
			String NomeCat = libro.get(i).getNomeCat();
	%>
	
	<!--Dispongo i dati che voglio mostrare in una struttura a tabella-->
	<tr bgcolor="yellow">
		<td><%=NomeCat%></td> 
		<td><%=TitLib%><br/></td>
		<td><%=DesLib%><br/></td>
		<%}%>
	</tr>
	</table>
</body>
</html>