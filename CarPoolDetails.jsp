
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
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
  <% 
                    HashMap c1=(HashMap)session.getAttribute("logininfo");
                    if(c1!=null){
                    
                %> 
  <body>
      <% 
         
              int cpid=Integer.parseInt(request.getParameter("cpid"));
        
        PreparedStatement getInfo=(PreparedStatement)application.getAttribute("getInfo");
        getInfo.setInt(1,cpid);
        ResultSet rs=getInfo.executeQuery();
        PreparedStatement getUser=(PreparedStatement)application.getAttribute("getUser");
        
        if(rs.next()){
            getUser.setString(1,rs.getString(2));
        ResultSet rs2=getUser.executeQuery();
            rs2.next();
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
	<a class="navbar-brand" href="#" style="color: Purple"><p>Car Pool</p></a>
	<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav navbar-right">
	<li class="active"><a href="UserHome.jsp" style="color: Purple">Home</a></li>
	<li><a href="MyRides.jsp" style="color: Purple"> My Rides </a></li>
	<li><a href="MySchedulings.jsp" style="color: Purple"> My Schedulings </a></li>
	<li ><a href="HowItWorks.jsp" style="color: Purple">How it works</a></li>
        <li><a href="Logout.jsp" style="color: Purple"> Logout </a></li>
	</ul>
  </div>
  </nav>
		<div class="jumbotron">
			<div class="row">
			<div class="col-md-2">
			
			<img src='GetPhoto?email=<%=rs.getString(2)%>' width="130" height="150">
			</div>
			<div class="col-md-8"  style="font-size:20px">
			<b>Name : <%=rs.getString(3) %></b><br/>
			<b>Email : <%=rs.getString(2) %></b><br/>
                        <b>Phone : <%=rs2.getString(3) %></b><br/>
			</div>
		</div>
		</div>
	<hr style="font-color:black"/>
	
<div class="row">
	<div class="col-md-10">
            <form class="form-horizontal" action="FixRides.jsp" data-toggle="validator" method="post">
                <input type="hidden" value="<%=cpid%>" name="cpid"/>
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">From:</label>
			<div class="col-sm-8">
                            <label  class="form-control" name="from"><%=rs.getString(4) %></label>
		</div></div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">To:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="to"><%=rs.getString(5) %></label>
		</div></div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">Timings:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="timings"><%=rs.getString(6) +" "+ rs.getString(7)%></label>
		</div></div>
		<div class="form-group">
			<label for="city" class="control-label col-sm-4">No. of Seats:</label>
			<div class="col-sm-8">
                            <select name="nseats" class="form-control"> 
                            <%
                                int x=rs.getInt(8)-rs.getInt(18);
                          if(x==0){ %>
                              <option value="0"> NO AVAILABLE SEATS </option>
                                    <%  }
                          else{
                              for(int a=1;a<=x;a++){ %>
                              <option value="<%=a%>"> <%=a%> </option>
                          <%  }
                            } %>
                            
                            </select>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-4">Price Per Seat:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="price"><%=rs.getInt(9) %></label>
		</div></div>
		<div class="form-group">
			<label for="carName" class="control-label col-sm-4">Car Name:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="cname"><%=rs.getString(10) %></label>
			</div>
		</div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Car Number:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="cno"><%=rs.getString(11) %></label>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Car Registration Certificate No:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="crno"><%=rs.getString(12) %></label>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Car Registration Certificate:</label>
			<div class="col-sm-8">
				<a href="DownloadFile?cpid=<%=cpid%>&type=crimg">    View</a>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Driving License No:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="dlno"><%=rs.getString(14) %></label>
		</div></div>
		<div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Driving License:</label>
			<div class="col-sm-8">
				<a href="DownloadFile?cpid=<%=cpid%>&type=dlimg">    View</a>
		</div></div>
                <div class="form-group">
			<label for="carnumber" class="control-label col-sm-4">Condition:</label>
			<div class="col-sm-8">
			<label  class="form-control" name="dlno"><%=rs.getString(17) %></label>
		</div></div>
		<div class="col-sm-offset-2 col-sm-2">
                    <%
                          if(x>0){ %>
                              <button type="submit" class="btn btn-success">  Fix My Ride </button>
                                    <%  }%>
		
		</div>
	</form></div>
                <br/>
</div> 
                <% session.setAttribute("ResultSet",rs); }
 
	String m=(String)session.getAttribute("msg1");
	if(m!=null)
	{
%>
	<b><em><%= m %></em></b>
<%
        session.setAttribute("msg1",null);
	}
%>

                   
                
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