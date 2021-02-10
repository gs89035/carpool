<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Car Pool</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Bahiana|Barrio" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
	<button type="button" class="navbar-toggle" 
	data-toggle="collapse" data-target=".navbar-collapse">
	<span class="sr-only">toggle Navigation</span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="#" style="color: Purple"><p>Car Pool</p></a>
	<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav navbar-right">
	<li class="active"><a href="UserHome.jsp" style="color: Purple">Home</a></li>
	<li><a href="HowItWorks.jsp" style="color: Purple">How it works</a></li>
       </ul>
  </div>
  </nav>
       <div class="well" style="color: Purple"> <h3>FEEDBACKS</h3></div>
                 <div class="jumbotron">
			<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-4"  style="font-size:20px">
  <%
      try{
      PreparedStatement ViewFeed=(PreparedStatement)application.getAttribute("ViewFeed");
             ResultSet rs=ViewFeed.executeQuery();
             while(rs.next())
             { 
                 %>
                        Car Scheduler Photo:<img src='GetPhoto?email=<%=rs.getString(4)%>' width="130" height="150"><br/>
                        Car Scheduler ID : <b><%= rs.getString(4)  %></b><br/>
			Car Scheduler Name : <b><%=rs.getString(5) %>  </b><br/>
			Reviewed By : <b><%=rs.getString(3) %> (<%=rs.getString(2) %>)</b><br/>
			Rating : <b><%=rs.getInt(6) %></b><br/>
			Review : <b><%=rs.getString(7) %></b><br/>
                        <hr/>
                        <br/>
<%                      }
             }
             catch(Exception ex)
             {
                %>
                <b>NO FEEDBACKS AT PRESENT..!!</b>
                <%
             }
  %>
      </div></div>
        </div>
      
      <!--Fixed Footer-->
  <div class="navbar navbar-inverse navbar-bottom">
	<div class="container">
		<div class="navbar-text pull-left">
		</div>
	</div>
  </div>
                 
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
       
  </body>

</html>