<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


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

<!--
Template Name: Halice
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html lang="">
<head>
<title>Cobianchi.it | Biblioteca</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- Top Background Image Wrapper -->
<div class="bgded overlay" style="background-image: url('images/demo/backgrounds/01.png');"> 
  <!-- ################################################################################################ -->
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <article>
      <h3 class="heading">Biblioteca</h3>
      <p>Benvenuto nel portale della biblioteca del Cobianchi</p>
      <p class="font-x1 uppercase bold">Accedi ai servizi</p>
      <footer>
        <ul class="nospace inline pushright">
        
          <li><a id="tohome" href="#home" class="btn">Home</a></li>
          
          <!-- <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>  -->
        
          <li><a class="btn inverse" href="#">Login</a></li>	<!--  QUA CI VA IL LINK AL FILE CHIAMATO login.jsp !!!  -->
          
        </ul>
      </footer>
    </article>
    <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div class="wrapper row0">
    <div id="topbar" class="hoc clear"> 
      <!-- ################################################################################################ -->
      <div class="fl_left">
        <ul>
          <li><i class="fa fa-phone"></i> +39 0323 401563</li>
          <li><i class="fa fa-envelope-o"></i> vbis00700v@istruzione.it</li>
        </ul>
      </div>
      <div class="fl_right">
        <ul>
          <li><a href="index.html"><i class="fa fa-lg fa-home"></i></a></li>
          <li><a href="#">Login</a></li>
          <li><a href="#">Registrati</a></li>
        </ul>
      </div>
      <!-- ################################################################################################ -->
    </div>
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->



<!-- ################################################################################################ -->
<!-- ##############################	 H	E	A	D	E	R	######################################### -->
<!-- ################################################################################################ -->

<!-- ///////////////////////////////////////	NAV BAR  ///////////////////////////////////////////// -->

<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
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
    <!-- ################################################################################################ -->
  </header>
</div>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////   -->


<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->


<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="center btmspace-80">
      <h6 class="heading">Consulta il servizio online</h6>
      <p class="heading font-x3">Scegli, ordina, ritira</p>
      <p>Ordina in modo pratico e veloce un libro direttamente dalla biblioteca dell'istituto</p>
    </div>
    
    <ul class="nospace group element btmspace-80">
    
    <%! int x; %>
    <% x=40; %>
    <% if(x>254){
    	x=0;} %>
      
     <%
		try{ 
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT TitLib,NomAut,DesLib,LinLib FROM tblbiblio INNER JOIN tblautore ON tblautore.CodAut=tblbiblio.CodAut";
		
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
    
    <% x=x+40; %>
    
      <li class="one_quarter" style="margin-left: 12px;">
        <article>
        
          <div style="height: 320px; width: 100%; background-color: rgb(255, 168, <%=x %>); font-size: 35px; text-align: center; padding: 45px 5px 10px 5px;" >
				
			<%=resultSet.getString("TitLib") %>

          </div>
          <div class="txtwrap">
            <h6 class="heading"><%=resultSet.getString("NomAut") %></h6>
            <p><%=resultSet.getString("DesLib") %></p>
            <footer><a href="<%=resultSet.getString("LinLib") %>">Link Libro</a></footer>
          </div>
        </article>
      </li>
      
      <% 
			}
			
			} catch (Exception e) {
			e.printStackTrace();
			}
		%>
      
    
    </ul>
    <footer class="center"><a class="btn" href="#">Nisl sollicitudin porta</a></footer>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('images/demo/backgrounds/02.png');">
  <article class="hoc cta clear"> 
    <!-- ################################################################################################ -->
    <div class="three_quarter first">
      <h6 class="header nospace">Risus vel mollis massa</h6>
      <p class="nospace">Iaculis morbi ultricies ullamcorper ipsum et blandit proin fringilla pharetra</p>
    </div>
    <footer class="one_quarter"><a class="btn" href="#">Dictum a ipsum &raquo;</a></footer>
    <!-- ################################################################################################ -->
  </article>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle center">
      <h6 class="heading">Lectus et vehicula</h6>
      <p>Enim ac congue libero quisque enim nisi quis</p>
    </div>
    <ul class="nospace group">
      <li class="one_quarter first">
        <article><a href="#"><i class="icon btmspace-30 fa fa-gitlab"></i></a>
          <h6 class="heading font-x1">Tincidunt fusce</h6>
          <p>Donec vel nunc velit etiam interdum commodo ornare nunc sed felis odio in [&hellip;]</p>
        </article>
      </li>
      <li class="one_quarter">
        <article><a href="#"><i class="icon btmspace-30 fa fa-globe"></i></a>
          <h6 class="heading font-x1">Id enim vulputate</h6>
          <p>Et lobortis orci vitae laoreet nisi donec malesuada sed elit nec bibendum [&hellip;]</p>
        </article>
      </li>
      <li class="one_quarter">
        <article><a href="#"><i class="icon btmspace-30 fa fa-tencent-weibo"></i></a>
          <h6 class="heading font-x1">Dignissim mauris</h6>
          <p>Nec orci sed lorem tempor dictum vitae imperdiet tellus curabitur semper [&hellip;]</p>
        </article>
      </li>
      <li class="one_quarter">
        <article><a href="#"><i class="icon btmspace-30 fa fa-wpexplorer"></i></a>
          <h6 class="heading font-x1">Dapibus viverra</h6>
          <p>Felis at massa elementum imperdiet id imperdiet ligula nulla eget hendrerit [&hellip;]</p>
        </article>
      </li>
    </ul>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('images/demo/backgrounds/03.png')">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle center">
      <h6 class="heading">Venenatis quam aenean</h6>
      <p>Sodales blandit felis in <a href="#">venenatis facilisis</a></p>
    </div>
    <div class="group testimonials">
      <article class="one_half first"><img src="images/demo/100x100.png" alt="">
        <blockquote>Fusce dignissim ex ac fermentum volutpat cras euismod vitae odio non luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus in tempor.</blockquote>
        <h6 class="heading">John D.</h6>
        <em>Finibus enim vel</em></article>
      <article class="one_half"><img src="images/demo/100x100.png" alt="">
        <blockquote>Iaculis neque at euismod proin sed luctus ex etiam mattis tortor est at mattis enim ultrices quis donec sed accumsan arcu in varius magna aenean ut lectus semper lorem ut.</blockquote>
        <h6 class="heading">Jane D.</h6>
        <em>Pretium lectus sed</em></article>
    </div>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <div class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle center">
      <h6 class="heading">Efficitur tincidunt dui sed</h6>
      <p>Facilisis mi efficitur quis vestibulum ante ipsum primis in faucibus orci</p>
    </div>
    <ul class="nospace group element">
      <li class="one_third first">
        <article>
          <figure><img src="images/demo/320x320.png" alt="">
            <figcaption>
              <time datetime="2045-04-06T08:15+00:00"><strong>06</strong> <em>Apr</em></time>
              <div><i class="fa fa-comments"></i> <a href="#">5</a></div>
            </figcaption>
          </figure>
          <div class="txtwrap">
            <h6 class="heading">Luctus et ultrices</h6>
            <p>Facilisis urna fusce metus velit semper sit amet iaculis non sollicitudin sit amet purus aliquam erat [&hellip;]</p>
            <footer><a class="btn" href="#">Read More</a></footer>
          </div>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><img src="images/demo/320x320.png" alt="">
            <figcaption>
              <time datetime="2045-04-05T08:15+00:00"><strong>05</strong> <em>Apr</em></time>
              <div><i class="fa fa-comments"></i> <a href="#">5</a></div>
            </figcaption>
          </figure>
          <div class="txtwrap">
            <h6 class="heading">Posuere cubilia curae</h6>
            <p>Volutpat nam nec vehicula nunc sed et enim justo quisque in rhoncus ex quisque placerat felis sed [&hellip;]</p>
            <footer><a class="btn" href="#">Read More</a></footer>
          </div>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><img src="images/demo/320x320.png" alt="">
            <figcaption>
              <time datetime="2045-04-04T08:15+00:00"><strong>04</strong> <em>Apr</em></time>
              <div><i class="fa fa-comments"></i> <a href="#">5</a></div>
            </figcaption>
          </figure>
          <div class="txtwrap">
            <h6 class="heading">Habitant morbi tristique</h6>
            <p>Nisi commodo interdum feugiat sagittis lectus in lacinia fusce sollicitudin pharetra dui ut malesuada [&hellip;]</p>
            <footer><a class="btn" href="#">Read More</a></footer>
          </div>
        </article>
      </li>
    </ul>
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </div>
</div>



<!-- ################################################################################################ -->
<!-- ##################################		F O O T E R		######################################### -->
<!-- ################################################################################################ -->


<!-- <div class="wrapper row4 bgded overlay" style="background-image:url('images/demo/backgrounds/04.png');">  -->

<div class="wrapper row4 bgded overlay">

  <footer id="footer" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="center btmspace-50">
      <h2 class="heading">Biblioteca | Cobianchi.it</h2>
      <nav>
        <ul class="nospace inline pushright uppercase">
          <li><a href="index.html"><i class="fa fa-lg fa-home"></i></a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contatti</a></li>
          <li><a href="#">Termini</a></li>
          <li><a href="#">Privacy</a></li>
          <li><a href="#">Cookies</a></li>
          <li><a href="#">Disclaimer</a></li>
        </ul>
      </nav>
    </div>
    <!-- ################################################################################################ -->
    <hr class="btmspace-50">
    <!-- ################################################################################################ -->
    <div class="group">
      <div class="one_third first">
        <h6 class="heading">Contatti</h6>
        <ul class="nospace btmspace-30 linklist contact">
          <li><i class="fa fa-map-marker"></i>
            <address>
            Street Name &amp; Number, Town, Postcode/Zip
            </address>
          </li>
          <li><i class="fa fa-phone"></i> +39 0323 401563</li>
          <li><i class="fa fa-fax"></i> +39 0323 401563</li>
          <li><i class="fa fa-envelope-o"></i> vbis00700v@istruzione.it</li>
        </ul>
      </div>
      <div class="one_third">
        <h6 class="heading">Dove siamo</h6>
        <figure>
        <!--  <a href="#"><img class="borderedbox inspace-10 btmspace-15" src="images/demo/320x168.png" alt=""></a>  -->
        <iframe src="https://www.google.com/maps/embed?pb=!1m17!1m11!1m3!1d1429.2023239165107!2d8.57461335874962!3d45.9398812529121!2m2!1f0!2f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4785dec8aca4c04d%3A0x82732138d9a6b40b!2sIIS+Cobianchi!5e1!3m2!1sit!2sit!4v1555063012467!5m2!1sit!2sit" width="284" height="150" frameborder="0" style="border:0" allowfullscreen></iframe>
          
        </figure>
      </div>
      <div class="one_third">
        <h6 class="heading">NewsLetter</h6>
        <p class="nospace btmspace-30">Inserisci i tuoi dati per rimanere aggiornato</p>
        <form method="post" action="#">
          <fieldset>
            <legend>Newsletter:</legend>
            <input class="btmspace-15" type="text" value="" placeholder="Name">
            <input class="btmspace-15" type="text" value="" placeholder="Email">
            <button type="submit" value="submit">Submit</button>
          </fieldset>
        </form>
      </div>
    </div>
    <!-- ################################################################################################ -->
  </footer>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2019 - Ogni diritto di utilizzo riservato - <a href="http://www.cobianchi.it">I.I.S. Cobianchi</a></p>
    <p class="fl_right">Template by <a target="_blank" href="http://fwtech.altervista.org/" title="Free Website Templates">Stefano Lietta</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>