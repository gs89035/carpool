

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <% 
        LocalDate cDate = LocalDate.now();
        String cd=cDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        String e2=request.getParameter("from");
        String e3=request.getParameter("to");
        
        PreparedStatement getCarBySrcDest=(PreparedStatement)application.getAttribute("getCarBySrcDest");
        getCarBySrcDest.setString(1,"%"+e2+"%");
        getCarBySrcDest.setString(2,"%"+e3+"%");
        getCarBySrcDest.setString(3,cd);
        ResultSet rs1=getCarBySrcDest.executeQuery();
        int f=0;
        ArrayList cp=new ArrayList();
            while(rs1.next())
            {
                f=1;
                HashMap c=new HashMap();
                c.put("cpid", rs1.getInt(1));
                c.put("email",rs1.getString(2));
                c.put("name",rs1.getString(3));
                c.put("timing",rs1.getString(6)+" "+rs1.getString(7));
                c.put("nseat", rs1.getInt(8)-rs1.getInt(18));
                c.put("price", rs1.getInt(9));
                cp.add(c);
            }
            rs1.close();
            if(f==1){
                session.setAttribute("cardata",cp);
                response.sendRedirect("UserHome.jsp");
            }
            else
            {
                session.setAttribute("msg","Data not found..");
                response.sendRedirect("UserHome.jsp");
            }


        %>
    </body>
</html>
