<%@page import="progetto_Biblioteca.bean.TblAutore" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title> Ricerca in base all'autore </title>
</head>
<body>

<form method="post" action="Servletlibro" name="autore">

	Autore: <select name="autore">
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
		//CodAut=lb.getCodAut();
		BioAut=lb.getBioAut();
		NomAut=lb.getNomAut();
		LinAut=lb.getLinAut();
	%>
	
	<option value=<%=CodAut%>> <%=NomAut%> </option>
		<%}%>
	</select><br/><br/>
	
	<input type="hidden" name = "whatsend" value="RicercaAutore">
	<input type="submit" value="Ricerca libro in base all'autore"> 

</form>
	
</body>
</html>
