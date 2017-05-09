<%-- 
    Document   : addRefund
    Created on : Apr 24, 2017, 4:53:25 PM
    Author     : yuanel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
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
        <title>Add Refund</title>
        <link href="./css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header1.jsp" flush="true"/>
        <jsp:useBean id="cart" scope="session" class="org.mypackage.hello.ShopCart" />
        <jsp:useBean id="myUsers" class ="org.mypackage.hello.Users"/>
        <jsp:useBean id="tran" class ="org.mypackage.hello.Refund"/>
        <%
            tran.setUsername(request.getParameter("username"));
            tran.setBName(request.getParameter("bname"));
            tran.setPrice(Float.parseFloat(request.getParameter("price")));
            tran.setAmount(Integer.parseInt(request.getParameter("amount")));
            tran.setLocation(request.getParameter("location"));
            tran.setCdNum(Integer.parseInt(request.getParameter("cdnumber")));
            tran.setCdSafeCd(Integer.parseInt(request.getParameter("cdSafetyCode")));
            tran.setStatus(0);
            try {
                    Context initCtx = new InitialContext();
                    Context envCtx = (Context)initCtx.lookup("java:comp/env");
                    DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
                    Connection con = ds.getConnection();

                    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    PreparedStatement pstmt = con.prepareStatement("INSERT INTO [Refund] ([username], [bname],[price],[amount],[location]"
                            + ",[cdnumber],[cdsafety],[status],[date],[tid]) VALUES (?, ?, ?,?,?,?,?,?,?,?)");
                    pstmt.setString(1, tran.getUsername());
                    pstmt.setString(2, tran.getBName());
                    pstmt.setFloat(3, tran.getPrice());
                    pstmt.setInt(4, tran.getAmount());
                    pstmt.setString(5, tran.getLocation());
                    pstmt.setInt(6, tran.getCdNum());
                    pstmt.setInt(7,tran.getCdSafeCd());
                    pstmt.setInt(8, tran.getStatus());
                    
                    String sdate=new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date()) ;
                    pstmt.setString(9, sdate );
                    pstmt.setInt(10, Integer.parseInt(request.getParameter("tid")) );
                   
                   %>
             <%
                    int rows = pstmt.executeUpdate();
                    if(rows>0){
            %>
            <p>
                Your refund application has been recorded!
            </p >
            <%
                    }

            String sql = "UPDATE transaction2 SET status=3 WHERE tid = "+request.getParameter("tid")+"";
            PreparedStatement pstmt1 = con.prepareStatement(sql);
            pstmt1.executeUpdate(); 
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