

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <% 
                    HashMap c1=(HashMap)session.getAttribute("logininfo");
                    if(c1!=null){
   %>
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
        <li><a href="MyRides.jsp" style="color: Purple"> My Rides </a></li>
	<li><a href="MySchedulings.jsp" style="color: Purple"> My Schedulings </a></li>
        <li><a href="Logout.jsp" style="color: Purple"> Logout </a></li>
	</ul>
  </div>
  </nav>
        <%
      int cpid=Integer.parseInt(request.getParameter("cpid"));
      PreparedStatement getInfo=(PreparedStatement)application.getAttribute("getInfo");
      getInfo.setInt(1,cpid);
      ResultSet r=getInfo.executeQuery();
      if(r.next())
      {
       %>
        <div class="row">
	<div class="col-sm-12">
         <div class="well" style="color: Purple"> <h2>FEEDBACK FORM</h2></div>
         <div class="col-sm-10">
        <form class="form-horizontal" data-toggle="validator" action="SetFeedback.jsp" method="post">
		<div class="form-group">
			<label for="cid" class="control-label col-sm-5">Car Scheduler ID : </label>
			<div class="col-sm-3">
                        <input type="hidden" value="<%=r.getString(2)%>" name="sid"/>
                        <input type="hidden" value="<%=cpid%>" name="cpid"/>
			<label  class="form-control" name="sid"><%=r.getString(2) %></label>
                        </div>
		</div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-5">Car Scheduler Name :</label>
			<div class="col-sm-3">
                        <input type="hidden" value="<%=r.getString(3)%>" name="sname"/>
			<label  class="form-control" name="sname"><%=r.getString(3) %></label>
		</div></div>
		<div class="form-group">
			<label for="rating" class="control-label col-sm-5">Your Rating:</label>
			<div class="col-sm-3">
			<select name="ratings" class="form-control"> 
                                <option>0</option>
				<option>0.5</option>
				<option>1</option>
				<option>1.5</option>
				<option>2</option>
                                <option>2.5</option>
				<option>3</option>
				<option>3.5</option>
				<option>4</option>
				<option>4.5</option>
                                <option>5</option>
                        </select>
		</div>
		</div>
                <div class="form-group">
			<label for="review" class="control-label col-sm-5">Your Review : </label>
			<div class="col-sm-3">
                        <textarea class="form-control" rows="5" id="review" name="review"></textarea>
		</div>
		</div>
		<div class="col-sm-offset-4 col-sm-4">
		<button type="submit" class="btn btn-default">  Submit </button>
		</div>
                        <%
                            }
%>
        </form><br/><br/><br/>
	</div>
        </div>
        </div>
        
       <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-2.2.2.min.js"></script>
	<script src="js/validator.js"></script> 
        
    </body>
    <%
                    }else{
                        session.setAttribute("msg", "Plz Login first");
                        response.sendRedirect("Home.jsp");
                    }
  %>
</html>
