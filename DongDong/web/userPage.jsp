<%-- 
    Document   : userPage
    Created on : Apr 14, 2017, 4:29:20 PM
    Author     : bochhuang2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link href="./css/index_style.css" rel="stylesheet" />
    </head>
    <body>
          <jsp:include page="header1.jsp" flush="true"/>
          <h1>
              Hello
              <%=session.getAttribute("username") %>
          </h1>
        <p>User Name:
            <%= session.getAttribute("username")
        %>
        </p>
      
        
        <% 
          if(session.getAttribute("role").equals(1)){// user
        %>
        <p>Your Loyalty Points:
            <%= session.getAttribute("loyaltyPoints")
        %>
        </p>
        
        <form action="checkTransaction.jsp" method="POST">
            <input type="hidden" name="userid" value="<%=session.getAttribute("username") %>" />
            <input type="submit" value="Check Recent Transactions" >
        </form>
            
        <%
            }
          else if(session.getAttribute("role").equals(0)){ // manager
        %>
        
        <form action="searchUser.jsp" method="POST">
            <input type="text" name="searchName" value=""/>
            <input type="submit" value="Search User" >
        </form>
        <br>
        <form action="checkRefund.jsp" method="POST">
            <input type="submit" value="Check Refund" >
        </form>
        <form action="checkBook.jsp" method="POST">
            <input type="submit" value="Check Book" >
        </form>
        <%
            }
        %>
        
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
