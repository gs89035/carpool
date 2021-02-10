
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <body>
        <%int crid=Integer.parseInt(request.getParameter("crid"));
        PreparedStatement updateCarStatus=(PreparedStatement)application.getAttribute("updateCarStatus");
        updateCarStatus.setString(1,"OFF");
        updateCarStatus.setInt(2,crid);
        updateCarStatus.executeUpdate();
        PreparedStatement getRideByCPID=(PreparedStatement)application.getAttribute("getRideByCPID");
        getRideByCPID.setInt(1,crid);
        ResultSet rr=getRideByCPID.executeQuery();
        while(rr.next()){
        PreparedStatement updateRideStatusS=(PreparedStatement)application.getAttribute("updateRideStatusS");
        updateRideStatusS.setString(1,"OFF");
        updateRideStatusS.setString(2,"Scheduller");
        updateRideStatusS.setInt(3,crid);
        updateRideStatusS.executeUpdate();
        String m="";
        try{
    final String AEMAIL=application.getInitParameter("aemail");
    final String APASS=application.getInitParameter("apass");
    String SEMAIL=rr.getString(2);
    String SUB="Ride Canceled by Scheduller.";
    String BODY="Ride Canceled by Scheduller. Ride ID: "+rr.getString(1);
    Properties props=new Properties();
    props.put("mail.smtp.host","smtp.gmail.com");
    props.put("mail.smtp.socketFactory.port","465");
    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.auth","true");
    props.put("mail.smtp.port","465");
    Session s=Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(AEMAIL,APASS);
                }
            }
            );
    InternetAddress internetAddress = new InternetAddress(SEMAIL);
    internetAddress.validate();
    Message message=new MimeMessage(s);
    message.setFrom(new InternetAddress(AEMAIL));
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(SEMAIL));
    message.setSubject(SUB);
    message.setContent(BODY,"text/html" );
    
    Transport.send(message);
    m="Mail Send Success";
}
catch(Exception ex){
    ex.printStackTrace();
    m="Mail Send Failed";
}
        }
        response.sendRedirect("MySchedulings.jsp");
        %>
    </body>
</html>
