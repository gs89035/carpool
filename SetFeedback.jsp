

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <body>
       <%
            HashMap c1=(HashMap)session.getAttribute("logininfo");
            String em=(String)c1.get("email");
            String name=(String)c1.get("name");
            String sid=request.getParameter("sid");
            String sname=request.getParameter("sname");
            Double rate=Double.parseDouble(request.getParameter("ratings"));
            String review=request.getParameter("review");
            PreparedStatement insertFeed=(PreparedStatement)application.getAttribute("insertFeed");
            insertFeed.setString(1,em);
            insertFeed.setString(2,name);
            insertFeed.setString(3,sid);
            insertFeed.setString(4,sname);
            insertFeed.setDouble(5,rate);
            insertFeed.setString(6,review);
            insertFeed.executeUpdate();
            response.sendRedirect("MyRides.jsp");
       %>
    </body>
</html>
