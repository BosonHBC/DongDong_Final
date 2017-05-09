<%-- 
    Document   : checkTransaction
    Created on : Apr 24, 2017, 7:19:19 PM
    Author     : zichuyuan2
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.lang.String, java.lang.StringBuffer" %>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.sql.Connection, javax.sql.DataSource" %>
<%@page import="java.sql.ResultSet, java.sql.Statement" %>
<%@page import="java.sql.SQLException, javax.naming.NamingException" %>
<%@page import="org.mypackage.hello.Transaction"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Transaction</title>
        <link href="./css/search_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header1.jsp" flush="true"/>
        <%  
            ArrayList<Integer> ids = new ArrayList();
            ArrayList<Transaction> tran=new ArrayList();
            String username;
            String inputUsername =request.getParameter("userid"); 
            
            try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/login_tb");
            Connection con = ds.getConnection();

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM Transaction2 ORDER BY username ASC");
            while (rs != null && rs.next() != false) {
                username = rs.getString("username");
                if(inputUsername.equals(username)){
                    Transaction t=new Transaction();
                    t.setUName(username);
                    t.setBName(rs.getString("bname"));
                    t.setAmount(rs.getInt("amount"));
                    t.setCdNum(rs.getInt("cdnumber"));
                    t.setCdSafeCd(rs.getInt("cdsafety"));
                    t.setLocation(rs.getString("location"));
                    t.setPrice(rs.getFloat("price"));
                    t.setStatus(rs.getInt("status"));
                    t.setDate(rs.getString("date"));
                    ids.add(rs.getInt("tid"));
                    tran.add(t);
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
        
        <div id="div_result">
            <P> You have 
            <%= tran.size()%>
            transactions record in total.
        </P>
        <table>
            <%
            
                for(int i=0;i<tran.size();i++){
            %>
            <tr>
                <td style="border: 1px solid #a1a1a1">
                    Transaction id:
                    <%=ids.get(i).toString()%>
                </td>
                <td style="border: 1px solid #a1a1a1">Book Name:
                    <%=tran.get(i).getBName() %>
                </td>
                <td style="border: 1px solid #a1a1a1">Amount:
                    <%=tran.get(i).getAmount()%>
                </td>
                <td style="border: 1px solid #a1a1a1">Price
                    <%=tran.get(i).getPrice() %>
                </td>
                <td style="border: 1px solid #a1a1a1">Delivery Location:
                    <%=tran.get(i).getLocation() %>
                </td>
                <td style="border: 1px solid #a1a1a1">Paying Credit Card:
                    <%=tran.get(i).getCdNum() %>
                </td>
                <td style="border: 1px solid #a1a1a1">Paying Date
                    <%=tran.get(i).getDate() %>
                </td>
                
                    <%
                    if(tran.get(i).getStatus()==0){
                %>  
                <td>
                    <form action="addRefund.jsp" method="POST">
                        <input type="hidden" name="tid" value="<%=ids.get(i).toString()%>">
                        <input type="hidden" name="bname" value="<%=tran.get(i).getBName() %>">
                        <input type="hidden" name="amount" value="<%=tran.get(i).getAmount()%>">
                        <input type="hidden" name="price" value="<%=tran.get(i).getPrice() %>">
                        <input type="hidden" name="location" value="<%=tran.get(i).getLocation() %>">
                        <input type="hidden" name="cdnumber" value="<%=tran.get(i).getCdNum() %>">
                        <input type="hidden" name="date" value="<%=tran.get(i).getDate() %>">
                        <input type="hidden" name="username" value="<%=tran.get(i).getUName() %>">
                        <input type="hidden" name="cdSafetyCode" value="<%=tran.get(i).getCdSafeCd() %>">
                        <input type="submit" value="Refund" >
                    </form>
                     </td>
                <%
                    }else if(tran.get(i).getStatus()==1){
                
                %>
               
                    <td style="border: 1px solid #a1a1a1">
                        Refund Successfully
                    </td>
                 <%
                    }else if(tran.get(i).getStatus()==3){
                
                %>
               
                    <td style="border: 1px solid #a1a1a1">
                        Pending
                    </td>
                <%        
                    }else{
                %>
               
                <td style="border: 1px solid #a1a1a1">
                    You could not refund this book, or your refund application has been rejected.
                </td>
                <%   }
            %>
            </tr>
            
            <%   }
            %>
        </table>
        </div>
         <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>