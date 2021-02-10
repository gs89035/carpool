<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <li><a href="Logout.jsp" style="color: Purple">Logout</a></li>
	</ul>
  </div>
  </nav>
      
      <div class="well" style="color: Purple"><center> <h4>My Schedulings History</h4> </center></div>
      <% Date cDate = new Date();
               SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
               java.sql.Date cd=new java.sql.Date(cDate.getTime()); 
      String em=(String)c1.get("email");
      PreparedStatement getCarByEmail=(PreparedStatement)application.getAttribute("getCarByEmail");
      PreparedStatement getInfoViaDate=(PreparedStatement)application.getAttribute("getInfoViaDate");
      PreparedStatement getInfoViaDate2=(PreparedStatement)application.getAttribute("getInfoViaDate2");
      PreparedStatement getRideByCPID=(PreparedStatement)application.getAttribute("getRideByCPID");
        getCarByEmail.setString(1,em);
        ResultSet r=getCarByEmail.executeQuery();
        
        %>
      <div class="well" style="color: Purple"> <h4>Upcoming Schedulings</h4></div>
      <%
        while(r.next()){
            
            int cpid=r.getInt(1);
             
             getInfoViaDate.setInt(1,cpid);
             getInfoViaDate.setDate(2,cd);
             ResultSet rs=getInfoViaDate.executeQuery();
             PreparedStatement getUser=(PreparedStatement)application.getAttribute("getUser");
        
        
            if(rs.next())
            {
                getUser.setString(1,rs.getString(2));
        ResultSet rs2=getUser.executeQuery();
            rs2.next();
        %>
  
	
		<div class="jumbotron">
			<div class="row">
			<div class="col-md-4"  style="font-size:20px; margin-left: 30px">
                            Name : <b><%=r.getString(3) %></b><br/>
                            From : <b><%=r.getString(4) %></b><br/>
			Car No : <b><%=r.getString(11) %></b><br/>
			Car Name : <b><%=r.getString(10) %></b><br/>
			Timing : <b><%=r.getString(6) +" "+ r.getString(7)%></b><br/>
			</div>
			<div class="col-md-4"  style="font-size:20px">
			Phone : <b><%=c1.get("phone") %></b><br/>
			To : <b><%=r.getString(5) %></b><br/>
			Total Seats : <b><%=r.getInt(8) %></b>, Available Seats : <b><%=r.getInt(8)-r.getInt(18) %></b><br/>
			Price per seat : <b><%=r.getString(9) %></b><br/>
                        Schedule Id : <b><%=r.getInt(1)%></b><br/>
			</div>
			<div class="col-md-2">
                            
                            <% 
                                if(r.getString(16).equals("ON"))
                                { %>
                                
                                <form action="SStatusUpdate.jsp">
                                <input type="hidden" value="<%=r.getInt(1)%>" name="crid"/>
                                <button type="Sumbit" class="btn btn-success"><b>cancel</b></button>
                                </form>
                                
                                <%
                                
                                   } else {
                                    %>
                                <span class="label label-success" style="font-size:20px">Canceled </span>                    
                        <%}
                        getRideByCPID.setInt(1,r.getInt(1));
                                ResultSet rr=getRideByCPID.executeQuery();
                                while(rr.next()){
                                %>
                               <img src='GetPhoto?email=<%=rr.getString(2)%>' width="50" height="50">
                               <%=rr.getString(2)%>, Seats: <%=rr.getString(4)%>, Status: <%=rr.getString(6)%>
                               <%if(rr.getString(6).equals("ON"))
                                { %>
                                
                                <form action="StatusUpdate.jsp">
                                <input type="hidden" value="<%=rr.getInt(1)%>" name="crid"/>
                                <input type="hidden" value="Scheduller" name="cb"/>
                                <input type="Submit" value='Cancel'/>
                                </form>
                                <%}else{
                                   out.print("Cancelled (by:"+rr.getString(8)+")");
                               }
                                
                                %>
                                <br/><hr/>
                            <%
                                }%>


                        </div>
		</div>
		</div>
                        
                        <%}}
getCarByEmail.setString(1,em);
r=getCarByEmail.executeQuery();
%>
<div class="well" style="color: Purple"> <h4>Last Rides</h4></div>
<%
 while(r.next())
        {
             int cpid=r.getInt(1);

             getInfoViaDate2.setInt(1,cpid);
             getInfoViaDate2.setDate(2,cd);
             ResultSet rs2=getInfoViaDate2.executeQuery();
            if(rs2.next())
{
	
  %>
        <div class="jumbotron">
			<div class="row">
			<div class="col-md-4"  style="font-size:20px; margin-left: 30px">
                            Name :  <b><%=r.getString(3) %></b><br/>
                            From : <b><%=r.getString(4) %></b><br/>
			Car No : <b><%=r.getString(11) %></b><br/>
			Car Name : <b><%=r.getString(10) %></b><br/>
			Timing : <b><%=r.getString(6) +" "+ r.getString(7)%></b><br/>
			</div>
			<div class="col-md-4"  style="font-size:20px">
			Phone : <b><%=c1.get("phone") %></b><br/>
			To : <b><%=r.getString(5) %></b><br/>
			Total Seats : <b><%=r.getInt(8) %></b><br/>
			Price per seat : <b><%=r.getString(9) %></b><br/>
                        Schedule Id : <b><%=r.getInt(1)%></b><br/>
			</div>
			<div class="col-md-2">
                            
                            
                            
                            <% 
                                if(r.getString(16).equals("DONE"))
                                { %>
                                <span class="label label-success" style="font-size:20px">Done</span>
                                <%  
                                   } else {
                                    %>
                                <span class="label label-success" style="font-size:20px">Canceled</span>                    
                        <%}
                         getRideByCPID.setInt(1,r.getInt(1));
                                ResultSet rr=getRideByCPID.executeQuery();
                                while(rr.next()){
                                %>
                               <img src='GetPhoto?email=<%=rr.getString(2)%>' width="50" height="50">
                               <%=rr.getString(2)%>, Seats: <%=rr.getString(4)%>, Status: <%=rr.getString(6)%>
                               <%if(rr.getString(6).equals("ON"))
                                { %>
                                
                                <form action="StatusUpdate.jsp">
                                <input type="hidden" value="<%=rr.getInt(1)%>" name="crid"/>
                                <input type="hidden" value="Scheduller" name="cb"/>
                                <input type="Submit" value='Cancel'/>
                                </form>
                                <%}else if(rr.getString(6).equals("DONE")){
                               }else{
                                   out.print("Cancelled (by:"+rr.getString(8)+")");
                               }
                                
                                %>
                                <br/><hr/>
                            <%
                                }       
                        
        }
        }%>


                        </div>
		</div>
		</div>
	<hr style="font-color:black"/>
        
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