<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>CarPool</title>

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
	<li class="active"><a href="Home.jsp" style="color: Purple">Home</a></li>
	<li ><a href="HowItWorks.jsp" style="color: Purple">How it works</a></li>
        <li ><a href="Feedback.jsp" style="color: Purple">Feedback</a></li>
        <li ><a href="About.jsp" style="color: Purple">About us</a></li>
	</ul>
  </div>
  </nav>
  <div class="container">
    <div id="mycarousel" class="carousel slide" data-ride="carousel" data-interval=3000>
		<ol class="carousel-indicators">
			<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
			<li data-target="#mycarousel" data-slide-to="1"></li>
			<li data-target="#mycarousel" data-slide-to="2"></li>
			<li data-target="#mycarousel" data-slide-to="3"></li>
			<li data-target="#mycarousel" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="img/car1.jpg">
				<div class="carousel-caption">
					<h1>THEME 1</h1>
				</div>
			</div>
			<div class="item">
				<img src="img/car2.jpg">
				<div class="carousel-caption">
					<h1>THEME 2</h1>
				</div>
			</div>
			<div class="item">
				<img src="img/car3.jpg">
				<div class="carousel-caption">
					<h1>THEME 3</h1>
				</div>
			</div>
			<div class="item">
				<img src="img/car4.jpg">
				<div class="carousel-caption">
					<h1>THEME 4</h1>
				</div>
			</div>
			<div class="item">
				<img src="img/car6.jpg">
				<div class="carousel-caption">
					<h1>THEME 5</h1>
				</div>
			</div>
		</div>
		 
		<a class="left carousel-control " href="#mycarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control " href="#mycarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>				
	</div>
	
	<hr/>
<div class="row">
	<div class="col-sm-6">
	<div class="well" style="color: Purple"> <h2>Sign Up</h2></div>
        <form class="form-horizontal" action="reg" data-toggle="validator" method="post" enctype="multipart/form-data" e >
		<div class="form-group">
			<label for="email" class="control-label col-sm-2">Email:</label>
			<div class="col-sm-8">
			<input type="email" class="form-control" name="email" required/>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="control-label col-sm-2">Name:</label>
			<div class="col-sm-8">
			<input type="text" class="form-control" name="name" required/>
		</div></div>
		<div class="form-group">
			<label for="phone" class="control-label col-sm-2">Phone:</label>
			<div class="col-sm-8">
			<input type="text" pattern="^[_0-9 ]{1,}$" maxlength='10' class="form-control" name="phone" required/>
		</div>
		</div>
                <div class="form-group">
			<label for="pwd" class="control-label col-sm-2">Password: </label>
			<div class="col-sm-8">
			<input type="password" class="form-control" name="pwd" required/>
		</div>
		</div>
		<div class="form-group">
			<label for="Upload Photo" class="control-label col-sm-2">Upload Photo:</label>
			<div class="col-sm-8">
			<input type="file" class="form-control" name="photo" required/>
		</div>
		</div>
		<div class="col-sm-offset-2 col-sm-2">
		<button type="submit" class="btn btn-default">  Register </button>
		</div>
		<div class="col-sm-offset-2 col-sm-2">
		<button type="reset" class="btn btn-default">  Reset </button>
		</div>
	</form><hr/><br/><br/><br/>
	</div>
	<div class="col-sm-5">
		<div class="well" style="color: Purple"><h2>Sign in</h2></div>
	<form class="form-horizontal" data-toggle="validator" action="LoginProcess.jsp" method="post">
		<div class="form-group">
			<label for="email" class="control-label col-sm-2">Email: </label>
			<div class="col-sm-8">
			<input type="email" class="form-control" name="email" required/>
		</div></div>
		<div class="form-group">
			<label for="pwd" class="control-label col-sm-2">Password: </label>
			<div class="col-sm-8">
			<input type="password" class="form-control" name="pwd" required/>
		</div>
		</div>
		
		<div class="col-sm-offset-2 col-sm-2">
		<br/><br/>
		<button type="submit" class="btn btn-default">  Sign In </button>
		</div>
		<div class="col-sm-offset-2 col-sm-5">
		<a href="cforgetpassword.jsp"> Forgot Password ? </a>
		<br/><br/>
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
		</div>
	</form><hr/><br/><br/><br/>
	</div>
</div> 
</div> 
	<div class="alert alert-success" align="center"><p>Why Car Pool</p></div>
	<div class="row">
	<div class="col-md-2">
				<img src="img/car2.jpg" width="100%" height="100%">
				</div>
	<div class="col-md-2">
				<img src="img/car1.jpg" width="100%" height="100%">
				</div>
	<div class="col-md-2">
				<img src="img/car3.jpg" width="100%" height="100%">
				</div>
	<div class="col-md-2">
				<img src="img/car4.jpg" width="100%" height="100%">
				</div>
	<div class="col-md-2" >
				<img src="img/car6.jpg" width="100%" height="100%">
				</div>
	<div class="col-md-2">
				<img src="img/car7.jpg" width="100%" height="100%">
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
</html>