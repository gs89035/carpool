
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <%int cpid=Integer.parseInt(request.getParameter("cpid"));
       try{
           ResultSet rs1=(ResultSet)session.getAttribute("ResultSet");
        HashMap c1=(HashMap)session.getAttribute("logininfo");
        String em=(String)c1.get("email"); 
        int n=rs1.getInt(18);
        int nseat=Integer.parseInt(request.getParameter("nseats"));
        
        int pay=nseat*(rs1.getInt(9));
        String st=rs1.getString(16);
        if(st.equals("ON")){
         session.setAttribute("em",em);
         session.setAttribute("cpid",cpid);
         session.setAttribute("nseat",nseat);
         session.setAttribute("pay",pay);
         session.setAttribute("n",n);
         session.setAttribute("st",st);
%>
    Confirm Payment:<hr/>
    Amount: <%=pay%> /- 
    <form action="FixRideProcess.jsp">
        <input type="hidden" name="pay" value="Latter" />
        <input type="submit" value="Pay Latter" />
    </form>
    <form action="${initParam['posturl']}">
        <input type="hidden" name="upload" value="1" />
        <input type="hidden" name="return" value="${initParam['returnurl']}" />
        <input type="hidden" name="cmd" value="_cart" />
        <input type="hidden" name="business" value="${initParam['business']}" />
        <input type="hidden" name="item_name_1" value="CarPool" /><br/>
        <input type="hidden" name="amount_1" value="<%=pay/nseat%>" /><br/>
        <input type="hidden" name="quantity_1" value="<%=nseat%>" /><br/>
        <input type="submit" value="Pay" />
    </form>
    
<%        
       }
       
       else{
               session.setAttribute("msg1","Ride Fixing Not Possible..!!");
response.sendRedirect("CarPoolDetails.jsp?cpid="+cpid);
               }
       }
       catch(Exception ex)
{       
       session.setAttribute("msg1","Ride Fixing Failed!!");
response.sendRedirect("CarPoolDetails.jsp?cpid="+cpid);
        
}
       
   %>
   
   
</html>
