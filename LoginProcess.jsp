
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String e=request.getParameter("email");
            String pwd=request.getParameter("pwd");
            PreparedStatement checkUser=(PreparedStatement)application.getAttribute("checkUser");
            checkUser.setString(1,e);
            checkUser.setString(2,pwd);
            HashMap c=new HashMap();
            ResultSet rs=checkUser.executeQuery();
            int f=0;
       // ArrayList cp=new ArrayList();
            if(rs.next())
            {
                f=1;
                c.put("name",rs.getString(2));
                c.put("email",rs.getString(1));
                c.put("phone",rs.getString(3));
                
            }
            rs.close();
            if(f==1){
                session.setAttribute("logininfo",c);
                response.sendRedirect("UserHome.jsp");
            }
            else
            {
                session.setAttribute("msg","Wrong ID or password..!!");
                response.sendRedirect("Home.jsp");
            }


            
           /* if(rs.next())
            {
                session.setAttribute("ResultSet",rs);
                response.sendRedirect("UserHome.jsp");
            }
            else
            {
                session.setAttribute("msg","Wrong ID or password..!!");
                response.sendRedirect("Home.jsp");
            }*/
            %>
        
    </body>
</html>
