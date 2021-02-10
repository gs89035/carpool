<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%
        String st=(String)session.getAttribute("st");
        String em=(String)session.getAttribute("em");
        int nseat=(Integer)session.getAttribute("nseat");
        int pay=(Integer)session.getAttribute("pay");
        int n=(Integer)session.getAttribute("n");
        int cpid=(Integer)session.getAttribute("cpid");
        String ps=request.getParameter("pay");
        PreparedStatement insertRide=(PreparedStatement)application.getAttribute("insertRide");
        insertRide.setString(1,em);
        insertRide.setInt(2,cpid);
        insertRide.setInt(3,nseat);
        insertRide.setInt(4,pay);
        insertRide.setString(5,st);
        if(ps==null){
            insertRide.setString(6,"Online");
        }else{
            insertRide.setString(6,"Latter");
        }
        insertRide.executeUpdate();
        int n1=n+nseat;
        PreparedStatement updateSeat=(PreparedStatement)application.getAttribute("updateSeat");
        updateSeat.setInt(1,n1);
        updateSeat.setInt(2,cpid);
        updateSeat.executeUpdate();

        String m="";
        try{
    final String AEMAIL=application.getInitParameter("aemail");
    final String APASS=application.getInitParameter("apass");
    String SEMAIL=em;
    String SUB="Ride Fixing Successful";
    String BODY="Ride Fixing Successful.";
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
catch(Exception e){
    e.printStackTrace();
    m="Mail Send Failed";
}

        session.setAttribute("msg1","Ride Fixing Successful..!! "+m);
        response.sendRedirect("CarPoolDetails.jsp?cpid="+cpid);
%>