<%@page import="progetto_Biblioteca.bean.TblAutore" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	boolean autorePresente=false;
	//int CodAut=0;
	String NomAut="";
	String BioAut="";
	String LinAut="";
	TblAutore lb=new TblAutore();
	lb=(TblAutore)request.getSession().getAttribute("Autore");
	if (lb != null){
		
		autorePresente=true;
		//CodAut=lb.getCodAut();
		BioAut=lb.getBioAut();
		NomAut=lb.getNomAut();
		LinAut=lb.getLinAut();
	}
%>

<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<title>Biblioteca | Nuovo Autore</title>
</head>
<body id="top">

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

<div style="position: sticky;">
<form method="post" action="BiblioServlet" name="autoreform">


<center><h3>Inserisci i dati dell'autore</h3><br>


		<!--  Codice<br><input type="number" name="CodAut" placeholder="Codice" value="">   -->
  <br><br>
  		Nome Cognome<br><input type="text" name="NomAut" placeholder="Nome" value="<%=NomAut%>" STYLE="background-color: rgb(255, 211, 211);" >
  <br><br>
  		Biografia<br><textarea type="text" name="BioAut" placeholder="Biografia" value="<%=BioAut%>" STYLE="background-color: rgb(255, 211, 211);"></textarea>
  <br><br>
  
  		link<br><input type="text" name="LinAut" placeholder="Link" value="<%=LinAut%>" STYLE="background-color: rgb(255, 211, 211);">
  <br><br>


  <br><br>

	<input type="hidden" name="whatsend" value="nuovoautoresession">
	
	<div>
	
		<input type="submit" value="Inserisci" class="inverse2">
		<input type="reset" value="Cancella" class="inverse2">
	
	</div>

		
		
</center>
</form>
</div>

<form method="post" action="BiblioServlet" name="Savedb">

	<input type="hidden" name="whatsend" value="NewAutoredb">
	
	<% if(autorePresente==true){ %>
	
	<input type="submit" value="Aggiungi libro in DB">		<!-- Per aggiungere un nuovo bottone, devo creare una nuova form -->

	<% } %>

</form>
</div>
</body>
</html>