<%-- 
    Document   : dosignup
    Created on : Apr 4, 2017, 4:23:33 PM
    Author     : bochhuang2
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.String, java.lang.StringBuffer" %>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.sql.Connection, javax.sql.DataSource" %>
<%@page import="java.sql.ResultSet, java.sql.Statement" %>
<%@page import="java.sql.SQLException, javax.naming.NamingException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Do signup</title>
        <link href="<%=request.getContextPath()%>/css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        
        
        <jsp:useBean id="myUsers" class ="org.mypackage.hello.Users"></jsp:useBean>
        <jsp:setProperty property="*" name="myUsers"/>
        <%
            
            String confirm = request.getParameter("password_c");
            if(myUsers.getUsername()== null || myUsers.getUsername().equalsIgnoreCase("")
                    ||
               myUsers.getPassword()== null || myUsers.getPassword().equalsIgnoreCase("")
                    ||
               confirm == null || confirm.equalsIgnoreCase("")){
                request.setAttribute("error","Empty input");
                request.setAttribute("username", myUsers.getUsername());
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            
            if(!request.getParameter("password").equals(confirm)){
                request.setAttribute("error","Confirm password is different from password");
                request.setAttribute("username", myUsers.getUsername());
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        %>
        <%
            boolean signUpSuccess = true;
            String inputUsername = myUsers.getUsername();
            String inputPassword = myUsers.getPassword();
            
            // check correctness of username and password from database 
            try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT username FROM login_tb ORDER BY username ASC");
            
            while (rs != null && rs.next() != false) {
                String username = rs.getString("username");
                
                if(inputUsername.equals(username)){ // repeated username
                    signUpSuccess = false;
                    
                    break;
                }
            }
            
            
            if(!signUpSuccess){
                request.setAttribute("error","Username was exisited, please choose another name");
                request.setAttribute("username", inputUsername);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            
            }
            if(signUpSuccess){  // add data into
                
                PreparedStatement pstmt = con.prepareStatement("INSERT INTO [login_tb] ([username], [password],[role]) VALUES (?, ?, ?)");
                pstmt.setString(1, inputUsername);
                pstmt.setString(2, inputPassword);
                pstmt.setInt(3, 1);
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
        %>
        <jsp:include page="..\header1.jsp" flush="true"/>    
        <div id="result" style="margin: 0 auto; width: 300px">
            <br>
        <legend>Sign up sucessfully!</legend>
        <%
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT @@IDENTITY AS [@@IDENTITY]");
                    if (rs != null && rs.next() != false) {
        %>
            <p>UID: <%= rs.getInt(1) %></p>
        <%
                       rs.close();
                    }
        %>
            <p>Name: <%= inputUsername %></p>
            <p>password: <%= inputPassword %></p>
        <%
                    if (stmt != null) {
                        stmt.close();
                    }
                }
                else {
        %>
            <legend>ERROR: New record is failed to create.</legend>
        <%
                }
                if (con != null) {
                    con.close();
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
        
        <a  href="../index.jsp"><img style="width: 50px; height: 50px" src="../image/back.jpg" alt="Back"/></a>
        </div>
        
        <jsp:include page="..\footer.jsp" flush="true"/>
    </body>
</html>
