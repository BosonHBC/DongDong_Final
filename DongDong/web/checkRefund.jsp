<%-- 
    Document   : checkRefund
    Created on : Apr 24, 2017, 9:14:39 PM
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM refund ORDER BY rid ASC");
            while (rs != null && rs.next() != false) {
               
        %>
        <tr>
            <td>Refund ID:
                <%= rs.getString("rid") %>
            </td>
            <td>User Name:
                <%= rs.getString("username") %>
            </td>
            <td>Book Name:
                <%= rs.getString("bname") %>
            </td>
            <td>Price
                <%= rs.getString("price") %>
            </td>
            <td>Amount
                <%= rs.getString("amount") %>
            </td>
            <td>Delivery Location
                <%= rs.getString("location") %>
            </td>
            <td>Credit Card
                <%= rs.getString("cdnumber") %>
            </td>
            <td>Purchase Date:
                <%= rs.getString("date") %>
            </td>
            <td>Authorize Status:
                <%= rs.getString("status") %>
            </td>
            <td>
                <%if(rs.getString("status").equals("0")){
                %>
                <form action="manageRefund.jsp" method="POST">
                    <input type="hidden" name="rid" value="<%=rs.getString("rid")%>" >
                    <input type="hidden" name="authorize" value="reject">
                    <input type="submit" value="Reject" >
                </form>
                <form action="manageRefund.jsp" method="POST">
                    <input type="hidden" name="rid" value="<%=rs.getString("rid")%>" >
                    <input type="hidden" name="authorize" value="accept">
                    <input type="submit" value="Accept" >
                </form>
            </td>
                <%
                }
                %>
            
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
