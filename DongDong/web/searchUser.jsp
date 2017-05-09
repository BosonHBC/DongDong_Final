<%-- 
    Document   : searchUserLoyPoints
    Created on : Apr 24, 2017, 11:23:26 AM
    Author     : yuanel
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.lang.String, java.lang.StringBuffer" %>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.sql.Connection, javax.sql.DataSource" %>
<%@page import="java.sql.ResultSet, java.sql.Statement" %>
<%@page import="java.sql.SQLException, javax.naming.NamingException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="./css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header1.jsp" flush="true"/>
        <jsp:useBean id="myUsers" class ="org.mypackage.hello.Users"></jsp:useBean>
        <%
            String username;
            String inputUsername =request.getParameter("searchName");
            boolean ifFind=false;
            int userRole = 0;
            float loyPoints=0;
            // check correctness of username and password from database 
            try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM login_tb ORDER BY username ASC");
            while (rs != null && rs.next() != false) {
                username = rs.getString("username");
                
                if(inputUsername.equals(username)){
                    userRole = rs.getInt("role");
                    loyPoints=rs.getFloat("loyaltyPoints");
                    ifFind=true;
                    break;
                }
            }
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            }
            catch (NamingException e) {
                %>
                    <div style='color: red'><%= e.toString() %></div>
                <%
            }catch (SQLException e) {
                %>
                    <div style='color: red'><%= e.toString() %></div>
                <%
            }
        %>
        <%
            if(ifFind){
        %>
        
         <p>User Name:
            <%= request.getParameter("searchName")
        %>
        </p>
        <p>Role:
            <%= userRole
        %>
        </p>
        
        <p>User's Loyalty Points:
            <%= loyPoints
        %>
        </p>
        
        <form action="loyPointsChange.jsp" method="POST">
            <input type="hidden" name="userid" value="<%= request.getParameter("searchName") %>" />
            <input type="hidden" name="changeType" value="0">
            
            <input type="text" name="addPoints" value="0" >
            <input type="submit" value="Add points" >
        </form>
            
        <form action="loyPointsChange.jsp" method="POST">
            <input type="hidden" name="userid" value="<%=request.getParameter("searchName") %>" />
            <input type="hidden" name="changeType" value="1">
            
            <input type="text" name="removePoints" value="0" >
            <input type="submit" value="Remove points" >
        </form>
        
        
        <%
            }else{
        %>
        <p>
            Invalid Search! Try again.
        </p>
        <%
            }
        %>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
