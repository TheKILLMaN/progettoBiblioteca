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
<title>Biblioteca | Riepilogo Dati</title>
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

	<br><br><br>
	<table class="newtable" style="width:50%;"><tbody><center class="heading">Il riepilogo dei dati</center><tr><td>Codice: &nbsp;</td><td>&nbsp;</td></tr><tr><td>Autore: &nbsp;</td><td><%=NomAut%>&nbsp;</td></tr><tr><td>Biografia:&nbsp;</td><td><%=BioAut%>&nbsp;</td></tr><tr><td>Link:&nbsp;</td><td><a href="<%=LinAut%>"> <%=LinAut%>&nbsp;</td></tr></tbody></table>

	<br>

<form method="post" action="BiblioServlet" name="Savedb">

	<input type="hidden" name="whatsend" value="NewAutoredb">
	
	<% if(autorePresente==true){ %>
	
	<center><input type="submit" value="Salva" class="inverse2"></center>	<!-- Per aggiungere un nuovo bottone, devo creare una nuova form -->

	<% } %>
	
	<br>
	<br>

</form>

</div>

</body

></html>




