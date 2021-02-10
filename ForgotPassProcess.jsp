<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page errorPage="Error.jsp" %>
<%
       
    String email = request.getParameter("email");
 //code for random string 
            
   PreparedStatement getUser=(PreparedStatement)application.getAttribute("getUser");
getUser.setString(1, email); 
ResultSet rs=getUser.executeQuery();
if(rs.next()){
    String pass=rs.getString("password");
  //Mail send Code
    try{
    String subject=" Successfully Password Send";
    String body="Your User ID:"+email+" and Password:"+pass;
    final String aemail=application.getInitParameter("aemail");
    final String apass=application.getInitParameter("apass");

    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.gmail.com");  
    properties.put("mail.smtp.socketFactory.port", "465");  
    properties.put("mail.smtp.socketFactory.class",  
          "javax.net.ssl.SSLSocketFactory");  
    properties.put("mail.smtp.auth", "true");  
    properties.put("mail.smtp.port", "465");
    Session ses = Session.getInstance(properties,    
        new javax.mail.Authenticator() {  
         protected PasswordAuthentication getPasswordAuthentication() {  
         return new PasswordAuthentication(aemail, apass); } 
        });  

    Message message = new MimeMessage(ses);  
    message.setFrom(new InternetAddress(aemail));  
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));  
    message.setSubject(subject);  
    message.setText(body);  
    Transport.send(message); //end -Mail send Code
    session.setAttribute("msg", "Password send Success.");
    }catch(Exception ex){
        session.setAttribute("msg", "EmailID is Incorrect");
    }  
    
}else{
    session.setAttribute("msg", "EmailID is Incorrect");
}

response.sendRedirect("Home.jsp");

%>