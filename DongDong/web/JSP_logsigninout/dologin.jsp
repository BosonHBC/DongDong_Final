<%-- 
    Document   : dologin
    Created on : Apr 4, 2017, 4:23:33 PM
    Author     : bochhuang2
--%>

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
        <title>Do login</title>
        <link href="<%=request.getContextPath()%>/css/index_style.css" rel="stylesheet" />
    </head>
    <body style="text-align: center">
        
       
        <jsp:useBean id="myUsers" class ="org.mypackage.hello.Users"></jsp:useBean>
        <jsp:setProperty property="*" name="myUsers"/>
        <%
            boolean loginSuccess = false;
            String inputUsername = myUsers.getUsername();
            String inputPassword = myUsers.getPassword();
            int myRole = 0;
            float loyPoints=0;
            // check correctness of username and password from database 
            try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM login_tb ORDER BY username ASC");
            // select * from userinfo where uid = myUsers.getUsername()
            // if stmt = null; return null username error
            // if exist, compare the username and password
            // if false, return wrong password or username error
            // if true, return true login page
            while (rs != null && rs.next() != false) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                
               
                if(inputUsername.equals(username) && inputPassword.equals(password)){
                    loginSuccess = true;
                    myRole = rs.getInt("role");
                    loyPoints=rs.getFloat("loyaltyPoints");
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
            
            // for simple first:
            //if( inputUsername.equals("admin")  && inputPassword.equals("admin")){
            
            //    loginSuccess = true;
           // }
            
            if(loginSuccess){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                String date = sdf.format(new Date(session.getCreationTime()));
                session.setAttribute("username", inputUsername);
                session.setAttribute("password", inputPassword);
                session.setAttribute("role", myRole);
                session.setAttribute("loyaltyPoints", loyPoints);
                session.setAttribute("logined",true);
            }
            if(!loginSuccess){
                request.setAttribute("error","Wrong Username or Password");
                request.setAttribute("username", inputUsername);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            
            }
        %>
        <jsp:include page="..\header1.jsp" flush="true"/>
         <div id="result" style="margin: 0 auto; width: 300px">
        <h2>Login Success!</h2>
        <a  href="../index.jsp"><img style="width: 50px; height: 50px" src="../image/back.jpg" alt="Back"/></a>
        </div>
        
         <jsp:include page="..\footer.jsp" flush="true"/>
    </body>
</html>
