<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.String, java.lang.StringBuffer" %>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.sql.Connection, javax.sql.DataSource" %>
<%@page import="java.sql.ResultSet, java.sql.Statement" %>
<%@page import="java.sql.SQLException, javax.naming.NamingException" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Phonebook</title>
    </head>
    <body>
        
        <h1>Phonebook (Retrieve)</h1>
        <div style='width:600px'>
        <fieldset>
        <legend>Phonebook Directoy</legend>
        
        <%
            
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/phonebook");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM [phonebook] ORDER BY [Name] ASC");
            if (rs != null && rs.last() != false) {
        %>
        <p>Total <%= rs.getRow() %> entries.</p>
        <%
                rs.beforeFirst();
            }
        %>
        <div><table style='width:100%'>
        <thead>
        <th align='left'>Name</th><th align='left'>Phone Number</th><th align='left'>Action</th>
        </thead>
        <tbody>
        <%
            while (rs != null && rs.next() != false) {
                String name = rs.getString("name");
                String phone = rs.getString("Phone");
                String uid = rs.getString("UID");
        %>
            <tr>
                <td><%= name %></td>
                <td><%= phone %></td>
                <td>
                    <a href='<%= request.getContextPath() %>/update.jsp?uid=<%= uid %>'>Update</a>
                    <a href='<%= request.getContextPath() %>/delete.jsp?uid=<%= uid %>'>Delete</a>
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
        %>
        </tbody>
        </table></div>
        <br/><a href='<%= request.getContextPath() %>/create.jsp'>Add a New Phonebook Entry</a>
        <%
        }
        catch (NamingException e) {
        %>
            <div style='color: red'><%= e.toString() %></div>
        <%
        } catch (SQLException e) {
        %>
            <div style='color: red'><%= e.toString() %></div>
        <%
        }
        %>
        </fieldset>
        </div>
        <jsp:include page="include/footer.jsp" />
    </body>
</html>