<%@page import="Query.Sql"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Bean.AutoreBean"%>
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
<title>Biblioteca | Rcerca per autore</title>
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
	<h2 align="center"><font><strong>Ricerca Libro per Autore</strong></font></h2>

<form method="post" action="Servletlibro" name="autore">

<table align="center" cellpadding="5" cellspacing="5" border="1">

	<tr>
		<td>
	<center> Seleziona Autore </center>
		</td>
		
	</tr>
	
	<tr>
	<td>
	<center>
	 <select name="autore">
	<% 
		ArrayList<AutoreBean> autore; 
		Sql db = new Sql();
		autore = db.SelezionaAutore(); 
		
		for(int i=0; i<autore.size(); i++)
		{
			String BioAut = autore.get(i).getBioAut(); 
			String NomAut = autore.get(i).getNomAut();
			String LinAut = autore.get(i).getLinAut();
			int CodAut = autore.get(i).getCodAut();		
	%>
	
	<option value=<%=CodAut%>> <%=NomAut%> </option>
		<%}%>
	</select>
	</center>
	</td>
	</tr>
	</tr>
	<td>
	<center>
	<input type="hidden" name = "whatsend" value="RicercaAutore">
	<input type="submit" value="Ricerca Libri">
	</center>
	</td>
	</tr>

</table>
</form>
	
</body>
</html>
