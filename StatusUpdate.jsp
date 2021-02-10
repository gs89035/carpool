
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
        <%
            HashMap c1=(HashMap)session.getAttribute("logininfo");
                    if(c1!=null){
                        int crid=Integer.parseInt(request.getParameter("crid"));
                    
        String cb=request.getParameter("cb");
        PreparedStatement updateRideStatus=(PreparedStatement)application.getAttribute("updateRideStatus");
        updateRideStatus.setString(1,"OFF");
        updateRideStatus.setString(2,cb);
        updateRideStatus.setInt(3,crid);
        updateRideStatus.executeUpdate();
        
        
        PreparedStatement getRideInfo2=(PreparedStatement)application.getAttribute("getRideInfo2");
             getRideInfo2.setInt(1,crid);
             ResultSet rs=getRideInfo2.executeQuery();
             rs.next();
             int cpid=rs.getInt(3);
             int seat=rs.getInt(4);
             
             
        PreparedStatement getInfo=(PreparedStatement)application.getAttribute("getInfo");
        getInfo.setInt(1,cpid);
        ResultSet r=getInfo.executeQuery();
        r.next();
        int n=r.getInt(18);
        int n1=n-seat;
        if(n1>=0){
        PreparedStatement updateSeat=(PreparedStatement)application.getAttribute("updateSeat");
        updateSeat.setInt(1,n1);
        updateSeat.setInt(2,cpid);
        updateSeat.executeUpdate();
        String m="";
        try{
    final String AEMAIL=application.getInitParameter("aemail");
    final String APASS=application.getInitParameter("apass");
    String SEMAIL=(String)c1.get("email");
    String SUB="Ride Canceled by You.";
    String BODY="Ride Canceled by You. Ride ID: "+crid;
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
        response.sendRedirect("MyRides.jsp");
}else{
                session.setAttribute("msg", "Plz Login first");
                response.sendRedirect("Home.jsp");
            }
        %>
    </body>
</html>
