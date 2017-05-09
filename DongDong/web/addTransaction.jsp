<%-- 
    Document   : addTransaction
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
        <title>Add Transaction</title>
        <link href="./css/search_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header1.jsp" flush="true"/>
        <jsp:useBean id="cart" scope="session" class="org.mypackage.hello.ShopCart" />
        <jsp:useBean id="myUsers" class ="org.mypackage.hello.Users"/>
        <jsp:useBean id="tran" scope="page" class ="org.mypackage.hello.Transaction"/>
        
    
        <%
            float sum=0;
            if(cart.getCommoditiesSize()>0){
                for(int i=0;i<cart.getCommoditiesSize();i++){
                    tran.setUName(session.getAttribute("username").toString());
                    tran.setAmount(cart.getCommodity(i).getNumber());
                    tran.setBName(cart.getCommodity(i).getName());
                    tran.setCdNum(Integer.parseInt(request.getParameter("cdNumber")));
                    tran.setCdSafeCd(Integer.parseInt(request.getParameter("cdSafetyCode")));
                    tran.setLocation(request.getParameter("location"));
                    tran.setPrice(cart.getCommodity(i).getPrice());
                    
                    if(Float.parseFloat(request.getParameter("loyPoints"))==0&&cart.getCommodity(i).getEbook()==1){
                        tran.setStatus(0);
                    }
                    else{
                        tran.setStatus(2);
                    }
                    sum+=cart.getCommodity(i).getPrice()*cart.getCommodity(i).getNumber();
                    cart.removeCommodity(i);
                    
            try {
                    Context initCtx = new InitialContext();
                    Context envCtx = (Context)initCtx.lookup("java:comp/env");
                    DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
                    Connection con = ds.getConnection();

                    Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                    PreparedStatement pstmt = con.prepareStatement("INSERT INTO [Transaction2] ([username], [bname],[price],[amount],[location]"
                            + ",[cdnumber],[cdsafety],[status],[date],[isrefund]) VALUES (?, ?, ?,?,?,?,?,?,?,?)");
                    pstmt.setString(1, tran.getUName());
                    pstmt.setString(2, tran.getBName());
                    pstmt.setFloat(3, tran.getPrice());
                    pstmt.setInt(4, tran.getAmount());
                    pstmt.setString(5, tran.getLocation());
                    pstmt.setInt(6, tran.getCdNum());
                    pstmt.setInt(7,tran.getCdSafeCd());
                    pstmt.setInt(8, tran.getStatus());
                   
                    String sdate=new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date()) ;
                    pstmt.setString(9, sdate );
                    if(tran.getStatus()==0){
                        pstmt.setInt(10, 1);
                    }
                    else {
                        pstmt.setInt(10, 0);
                    }
                   %>
             <%
                    int rows = pstmt.executeUpdate();
                    if(rows>0){
            %>
            <div id="div_result">
            <h4>
                Congratulation! Your Purchasing is successful!<br>
            </h4 >
            <%
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
        
        <p>Purchasing Details:</p >
        <table>
            <tr>
                <td  style="border: 2px solid #a1a1a1">Book name</td><td style="border: 2px solid #a1a1a1">Amount</td><td style="border: 2px solid #a1a1a1">Price</td><td style="border: 2px solid #a1a1a1">Address</td>
            </tr>
            <tr>
                <td style="border: 1px solid #a1a1a1"><%=tran.getBName() %></td><td  style="border: 1px solid #a1a1a1"><%=tran.getAmount()%></td><td style="border: 1px solid #a1a1a1"><%=tran.getPrice() %></td><td style="border: 1px solid #a1a1a1"><%=tran.getLocation() %></td>
            </tr>
        </table>

        
        <%
                }
            }
        %>
        <p>
            Total Price:
            <%=
                sum
            %>
        </p >
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>