<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
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
     <% 
                    HashMap c1=(HashMap)session.getAttribute("logininfo");
                    if(c1!=null){
                    Date cDate = new Date();
               SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
               java.sql.Date cd=new java.sql.Date(cDate.getTime());
       
      PreparedStatement schedulingDone=(PreparedStatement)application.getAttribute("schedulingDone");
      schedulingDone.setDate(1, cd);
      schedulingDone.executeUpdate();
      PreparedStatement getCridDone=(PreparedStatement)application.getAttribute("getCridDone");
             ResultSet rs2=getCridDone.executeQuery();
             while(rs2.next()){
                 PreparedStatement rideDone=(PreparedStatement)application.getAttribute("rideDone");
      rideDone.setInt(1, rs2.getInt(1));
      rideDone.executeUpdate();
             }
      
                %> 
  <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
	<button type="button" class="navbar-toggle" 
	data-toggle="collapse" data-target=".navbar-collapse">
	<span class="sr-only">toggle Navigation</span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="UserHome.jsp" style="color: Purple"><p>Car Pool</p></a>
	<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav navbar-right">
	<li class="active"><a href="UserHome.jsp" style="color: Purple">Home</a></li>
	<li><a href="MyRides.jsp" style="color: Purple"> My Rides </a></li>
	<li><a href="MySchedulings.jsp" style="color: Purple"> My Schedulings </a></li>
        <li><a href="Logout.jsp" style="color: Purple"> Logout </a></li>
	</ul>
  </div>
  </nav>
       
		<div class="jumbotron">
			<div class="row">
			<div class="col-md-2">
			<img src='GetPhoto?email=<%=c1.get("email")%>' width="130" height="150">
			</div>
			<div class="col-md-8"  style="font-size:20px">
                           
                        <h3><b>Name: <i><%=c1.get("name") %> </i></b><br/></h3>
			<h3><b>Email: <i><%=c1.get("email") %> </i></b><br/><h3/>
			<h3><b>Phone: <i><%=c1.get("phone") %></i></b><h3/>
			</div>
<!--			<div class="col-md-2">
			<button type="Button" class="btn btn-success"><b>Edit</b></button>
			</div>-->
		</div>
		</div>
	<hr style="font-color:black"/>
	
<div class="row">
	<div class="col-md-6">
			<div class="well"><h2 style="color:Purple">Place where you want to Ride</h2></div>
	<form class="form-horizontal" data-toggle="validator" action="Search.jsp" method="post">
		
		<div class="form-group">
			<label for="name" class="control-label col-sm-2">From:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="from" required/>
		</div></div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-2">To:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="to" required/>
		</div></div>
            <div class="col-sm-offset-2 col-sm-2">
		<button type="submit" class="btn btn-success">  Go </button>
		</div>
	</form>
		
		<hr/><br/><br/><br/> 
		<div class="row">
		<div class="col-md-12">
		<div class="well"><h2 style="color:Purple">Search Results:  </h2></div>
                <% 
                    ArrayList c=(ArrayList)session.getAttribute("cardata");
                    if(c!=null){
                    Iterator i=c.iterator();
                    while(i.hasNext()){
                        HashMap cp=(HashMap)i.next();
                %>
                 
		<div class="panel panel-primary"  style="background-color:lightgrey;">
			<div class="panel-body" >
				
			<div class="row">
			<div class="col-md-3">
			<img src='GetPhoto?email=<%=cp.get("email")%>' width="130" height="150">
			</div>
			<div class="col-md-7"  style="font-size:20px">
                          
                            Car-owner Name:<b> <%=cp.get("name") %></b><br/>
                        Timings: <b><%=cp.get("timing") %></b><br/>
			No. of seats available: <b><%=cp.get("nseat") %></b><br/>
			Price per seat: <b><%=cp.get("price") %></b><br/>
			</div>
			<div class="col-md-2">
                            <form action="CarPoolDetails.jsp" method="get">
                                <input type="hidden" value="<%=cp.get("cpid")%>" name="cpid"/>
			<button type="Sumbit" class="btn btn-success"><b>View</b></button>
                        </form>
			</div>
		</div>	
			</div>	
		</div>
                <%    }
                    session.setAttribute("cardata", null);
                 }
                 
                %>
		</div>
		</div>
	</div>
        <% 
	String m=(String)session.getAttribute("msg");
	if(m!=null)
	{
%>
	<b><em><%= m %></em></b>
<%
        session.setAttribute("msg", null);
	}
%>
	<div class="col-sm-6">
	<div class="well" style="color: Purple"> <h2>Schedule Your Own Car</h2></div>
	<div class="col-sm-8">
	<form class="form-horizontal"  action="sch" method="post"  data-toggle="validator" enctype="multipart/form-data" e>
                <div class="form-group">
			<label for="name" class="control-label col-sm-4">Name:</label>
			<div class="col-sm-8">
                             
                            <input type="text" class="form-control" name="name" value="<%=c1.get("name") %>" required/>
		</div></div>
            <div class="form-group">
			<label for="name" class="control-label col-sm-4">From:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="from" required/>
		</div></div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">To:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="to" required/>
		</div></div>
                <div class="form-group">
			<label for="name" class="control-label col-sm-4">Date:</label>
			<div class="col-sm-8">
			<input type="date" class="form-control" name="sdate" required/>
		</div></div>
		<div class="form-group">
			<label for="city" class="control-label col-sm-4 " required>Timings:</label>
			<div class="col-sm-3">
			<select name="stime1" class="form-control">
				<option>1:00</option>
				<option>1:30</option>
				<option>2:00</option>
				<option>2:30</option>
				<option>3:00</option> 
                                <option>3:30</option> 
                                <option>4:00</option> 
                                <option>4:30</option> 
                                <option>5:00</option> 
                                <option>5:30</option> 
                                <option>6:00</option> 
                                <option>6:30</option> 
                                <option>7:00</option> 
                                <option>7:30</option> 
                                <option>8:00</option> 
                                <option>8:30</option>
                                <option>9:00</option> 
                                <option>9:30</option>
                                <option>10:00</option> 
                                <option>10:30</option>
                                <option>11:00</option> 
                                <option>11:30</option>
                                <option>12:00</option> 
                                <option>12:30</option>
			</select>
			</div>
                        <div class="col-sm-3">
                          <select name="stime2" class="form-control">
				<option>AM</option>
				<option>PM</option>  
                                </select>
                        </div>
                        
		</div>
		<div class="form-group">
			<label for="city" class="control-label col-sm-4">No. of Seats:</label>
			<div class="col-sm-4">
			<select name="nseat" class="form-control">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option> 
			</select>
			</div>
		</div>
            
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">Price Per Seat:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="priceseat" required/>
		</div></div>
		<div class="form-group">
			<label for="carName" class="control-label col-sm-4">Car Name:</label>
			<div class="col-sm-8">
			<select name="cname" class="form-control">
				<option>Maruti Ciaz</option>
				<option>Maruti Baleno</option>
				<option>Tata Tiago</option>
				<option>Maruti Swift Dzire</option>
				<option>Honda City</option>
				<option>Ford Figo/Aspire</option>
				<option>Honda Amaze </option>
			</select>
			</div>
		</div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Car Number:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="cno" required/>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Car Registration Certificate No:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="crno" required/>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Car Registration Certificate:</label>
			<div class="col-sm-8">
			<input type="file" class="form-control" name="crimg" required/>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Driving License No:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="dlno" required/>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Driving License:</label>
			<div class="col-sm-8">
			<input type="file" class="form-control" name="dlimg" required/>
		</div></div>
                <div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Conditions:</label>
			<div class="col-sm-8">
			<textarea class="form-control" name="cndtn" cols="" rows="3" required></textarea>
		</div></div>
                
		<div class="col-sm-offset-2 col-sm-2">
		<button type="submit" class="btn btn-success">  Schedule </button>
		</div>
		<div class="col-sm-offset-2 col-sm-2">
		<button type="reset" class="btn btn-success">  Reset </button>
		</div>
	</form><hr/><br/><br/><br/>
	</div>
</div> 
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