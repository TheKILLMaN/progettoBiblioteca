<%@page import="progetto_Biblioteca.bean.TblBiblio" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%


	boolean libroPresente=false;
	int CodDesBib=0;
	int CodAut=0;
	String TitLib="";
	int CodCat=0;
	String DesLib="";
	String LinLib="";
	TblBiblio lb=new TblBiblio();
	lb=(TblBiblio)request.getSession().getAttribute("Libro");
	if (lb != null){
		
		libroPresente=true;
		

		CodDesBib=lb.getCodDesBib();
		CodAut=lb.getCodAut();
		TitLib=lb.getTitLib();
		CodCat=lb.getCodCat();
		DesLib=lb.getDesLib();
		LinLib=lb.getLinLib();
		
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserimento Nuovo Autore</title>
</head>
<body>


	<style type="text/css">
		
		form{
			margin: auto;
			width: 20%;
			background-color: #fc5c65;
			padding: 20px;
			border: auto;
			height: 30%;

			font-family: fantasy;
			
		}



	</style>
	

<!-- <form name="dati" action="/company_management/FirstServlet" method="POST"> -->

<form name="dati" action="/progettoBiblioteca/BiblioServlet" name="autoreform" method="POST">


<center><h3>Inserisci i dati dell'autore</h3><br>


		  Codice Libro<br><input type="text" name="CodDesBib" placeholder="Codice">
  <br><br>
   		Codice Autore<br><input type="text" name="CodAut" placeholder="Codice">
  <br><br>
  		Titolo<br><input type="text" name="TitLib" placeholder="Nome">
  <br><br>
  		Codice Categoria<br><input type="text" name="CodCat" placeholder="Codice">
  <br><br>
  		Descrizione<br><textarea type="text" name="DesLib" placeholder="Biografia"></textarea>
  <br><br>
  
  		link<br><input type="text" name="LinLib" placeholder="Link">
  <br><br>
  
  
  <input name="whatsend" value="TblBiblio" type="hidden">


  <br><br>
  <input type="submit" value="Submit">
  <input type="reset" value="Reset">
		
		
</center>
</form>

</body>
</html>