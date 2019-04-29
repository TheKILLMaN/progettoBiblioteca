<%@page import="progetto_Biblioteca.bean.TblCategoria" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	boolean catPresente=false;
	//int CodCat=0;
	String NomeCat="";

	TblCategoria lb=new TblCategoria();
	lb=(TblCategoria)request.getSession().getAttribute("Categoria");
	if (lb != null){
		
		catPresente=true;
		

		//CodCat=lb.getCodCat();
		NomeCat=lb.getNomeCat();
		
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

<form name="dati" action="/progettoBiblioteca/BiblioServlet" name="categoriaform" method="POST">


<center><h3>Inserisci i dati della categoria</h3><br>


   		
  		Nome Categoria<br><input type="text" name="NomeCat" placeholder="Nome">
  <br><br>
  
  
  <input name="whatsend" value="nuovacetgoriasession" type="hidden">


  <br><br>
  <input type="submit" value="Inserisci"  class="inverse2">
  <input type="reset" value="Cancella"  class="inverse2">
  
  
<form method="post" action="BiblioServlet" name="Savedb">

	<input type="hidden" name="whatsend" value="NewCatdb">
	
	<% if(catPresente==true){ %>
	
	<input type="submit" value="Aggiungi categoria in DB">		<!-- Per aggiungere un nuovo bottone, devo creare una nuova form -->

	<% } %>

</form>
		
		
</center>
</form>
</div>
</body>
</html>