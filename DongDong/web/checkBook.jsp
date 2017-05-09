<%-- 
    Document   : checkBook
    Created on : Apr 24, 2017, 9:15:19 PM
    Author     : zichuyuan2
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
        <table>
        <%
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM book ORDER BY b_name ASC");
            while (rs != null && rs.next() != false) {
               
        %>
        <tr>
            <td>Book ID:
                <%= rs.getString("bid") %>
            </td>
            <td>Book Name:
                <%= rs.getString("b_name") %>
            </td>
            <td>Author:
                <%= rs.getString("b_author") %>
            </td>
            <td>Price:
                <form action="manageBook.jsp" method="POST">
                    <input type="hidden" name="bid" value="<%=rs.getString("bid")%>" >
                    <input type="text" name="price"value="<%=rs.getString("b_price")%>">
                    <input type="submit" value="Change Price" >
                </form>
            </td>
            <td>Publisher:
                <%= rs.getString("b_pulisher") %>
            </td>
            <td>Quality:
                <form action="manageBook.jsp" method="POST">
                    <input type="hidden" name="bid" value="<%=rs.getString("bid")%>" >
                    <input type="text" name="quality" value="<%=rs.getString("b_stock")%>">
                    <input type="submit" value="Change Stock" >
                </form>
            </td>
           
        </tr>    
        <%
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
        </table>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
