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
	<li><a href="MySchedulings.jsp" style="color: Purple"> My Scheduling </a></li>
        <li><a href="Logout.jsp" style="color: Purple"> Logout </a></li>
	</ul>
  </div>
  </nav><%
      Date cDate = new Date();
               SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
               java.sql.Date cd=new java.sql.Date(cDate.getTime());
       
      String em=(String)c1.get("email");
      PreparedStatement getRideByEmail=(PreparedStatement)application.getAttribute("getRideByEmail");
      PreparedStatement getUser=(PreparedStatement)application.getAttribute("getUser");
        getRideByEmail.setString(1,em);
        ResultSet r=getRideByEmail.executeQuery();
       %>
        <div class="well" style="color: Purple"> <h4>Upcoming Rides</h4></div>
       <% while(r.next())
        {
            int cpid=r.getInt(3);
             PreparedStatement getInfoViaDate=(PreparedStatement)application.getAttribute("getInfoViaDate");
             getInfoViaDate.setInt(1,cpid);
             getInfoViaDate.setDate(2,cd);
             ResultSet rs=getInfoViaDate.executeQuery();
             
        
        
            if(rs.next())
            {
                getUser.setString(1,rs.getString(2));
        ResultSet rs2=getUser.executeQuery();
            rs2.next();
          %>
          <div class="jumbotron">
			<div class="row">
			<div class="col-md-2">
			<img src='GetPhoto?email=<%=rs.getString(2)%>' width="130" height="150">
			</div>
			<div class="col-md-4"  style="font-size:20px">
			Name: <b><%=rs.getString(3) %></b><br/>
			From: <b><%=rs.getString(4) %></b><br/>
			Email: <b><%=rs.getString(2) %></b><br/>
			Car No: <b><%=rs.getString(11) %></b><br/>
			Car Name: <b><%=rs.getString(10) %></b><br/>
			</div>
			<div class="col-md-3"  style="font-size:20px">
			Phone: <b><%=rs2.getString(3) %></b><br/>
			To: <b><%=rs.getString(5) %></b><br/>
                        No of seats Booked : <b><%=r.getString(4) %></b><br/>
			Amount: <b><%=r.getString(5) %></b><br/>
			Timing : <b><%=rs.getString(6)+" "+rs.getString(7) %></b><br/>
			</div>
                        <div class="col-md-3">
                            <% 
                                if(r.getString(6).equals("ON"))
                                { %>
                                <form action="StatusUpdate.jsp">
                                <input type="hidden" value="<%=r.getInt(1)%>" name="crid"/>
                                <input type="hidden" value="Rider" name="cb"/>
                                <button type="Sumbit" class="btn btn-success"><b>cancel</b></button>
                                </form>
        <%  
           } else{
            %>
        <span class="label label-success" style="font-size:20px">canceled (by:<%=r.getString(8)%>)</span>                    
<%}%>
</div>
                        </div>
                        </div>
          
<%}}
getRideByEmail.setString(1,em);
r=getRideByEmail.executeQuery();
%>
<div class="well" style="color: Purple"> <h4>Last Rides</h4></div>
<%
 while(r.next())
        {
             int cpid=r.getInt(3);
PreparedStatement getInfoViaDate2=(PreparedStatement)application.getAttribute("getInfoViaDate2");
             getInfoViaDate2.setInt(1,cpid);
             getInfoViaDate2.setDate(2,cd);
             ResultSet rs2=getInfoViaDate2.executeQuery();
            if(rs2.next())
{
	getUser.setString(1,rs2.getString(2));
        ResultSet rs4=getUser.executeQuery();
            rs4.next();
  %>
	
		<div class="jumbotron">
			<div class="row">
			<div class="col-md-2">
			<img src='GetPhoto?email=<%=rs2.getString(2)%>' width="130" height="150">
			</div>
			<div class="col-md-4"  style="font-size:20px">
			<b>Name : <%=rs2.getString(3) %></b><br/>
			<b>From:<%=rs2.getString(4) %></b><br/>
			<b>Email:<%=rs2.getString(2) %></b><br/>
			<b>Car No::<%=rs2.getString(11) %></b><br/>
			<b>Car Name:<%=rs2.getString(10) %></b><br/>
			</div>
			<div class="col-md-4"  style="font-size:20px">
			<b>Phone:<%=rs4.getString(3)%></b><br/>
			<b>To : <%=rs2.getString(5) %></b><br/>
			<b>No of seats Booked : <%=r.getString(4) %></b><br/>
			<b>Amount :<%=r.getString(5) %></b><br/>
			<b>Timing : <%=rs2.getString(7) %></b><br/>
			</div>
			<div class="col-md-2">
                            <% 
                                if(r.getString(6).equals("DONE"))
                                { %>
	<span class="label label-success" style="font-size:20px">Done</span>
        <br/><br/><br/>
        <%
        PreparedStatement getFeed=(PreparedStatement)application.getAttribute("getFeed");
             getFeed.setString(1,em);
             getFeed.setInt(2,cpid);
             ResultSet rf=getFeed.executeQuery();
            if(rf.next())
            {
        %>
        Your Feedback: Rating : <b><%=rf.getInt(6) %></b><br/>
			Review : <b><%=rf.getString(7) %></b><br/>
        <%        
            }else{
        %>
        <form action="FeedbackIn.jsp">
        <input type="hidden" value="<%=cpid%>" name="cpid"/>
        <button type="Sumbit" class="btn btn-success"><b>Feedback</b></button>
        </form>
        <%        
            } 
           }

else{
            %>
        <span class="label label-success" style="font-size:20px">Canceled</span>
                <%
                }%>
                
</div>
                </div>

<%
}
 }

%>
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
  <%
                    }else{
                        session.setAttribute("msg", "Plz Login first");
                        response.sendRedirect("Home.jsp");
                    }
  %>
</html>