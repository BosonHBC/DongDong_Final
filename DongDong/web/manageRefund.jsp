<%-- 
    Document   : managerBook
    Created on : Apr 24, 2017, 9:33:10 PM
    Author     : zichuyuan2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <%
            
            
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
            if(request.getParameter("authorize").equals("accept")){
               
                String sql = "UPDATE refund SET status=1 WHERE rid = "+request.getParameter("rid")+"";
                PreparedStatement pstmt1 = con.prepareStatement(sql);
                pstmt1.executeUpdate(); 
                
                
            }
            else if(request.getParameter("authorize").equals("reject")){
               
                String sql = "UPDATE refund SET status=2 WHERE rid = "+request.getParameter("rid")+"";
                PreparedStatement pstmt1 = con.prepareStatement(sql);
                pstmt1.executeUpdate();
                sql="SELECT tid FROM refund  WHERE rid = "+request.getParameter("rid")+"";
                pstmt1 = con.prepareStatement(sql);
               pstmt1.executeUpdate(); 
            }
            
            
               
        %>
        <p>Your update has recorded</p>
        <%
                
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
        
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
