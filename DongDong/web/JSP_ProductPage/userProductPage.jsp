<%-- 
    Document   : userProductPage
    Created on : Apr 21, 2017, 5:27:35 PM
    Author     : bochhuang2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Product Page</title>
        <link href="<%=request.getContextPath()%>/css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="..\header1.jsp" flush="true"/>
        
        <p>User Name:
            <%= session.getAttribute("username")
        %>
        </p>
        <p>Role:
            <%= session.getAttribute("role")
        %>
        </p>
        <p>Role:
            <%= session.getAttribute("role")
        %>
        </p>
        
        <p>Loyalty Points:
            <%= session.getAttribute("loyaltyPoints")
        %>
        </p>
       
        
        <jsp:include page="..\footer.jsp" flush="true"/>
    </body>
</html>
