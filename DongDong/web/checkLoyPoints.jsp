<%-- 
    Document   : purchase
    Created on : 2017-4-24, 1:27:02
    Author     : elvis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check loypoints</title>
        <link href="./css/index_style.css" rel="stylesheet" />
    </head>
    <body>
       <jsp:include page="header1.jsp" flush="true"/>
       <p>
          
           <form action="purchase.jsp" method="POST">
                You have <%= session.getAttribute("loyaltyPoints")%> loyalty points now,how many points you want to use?
                <input type="text" name="loyPoints" value="0">
                <input type="submit" value="Pay now" >
            </form>
       </p>
          
       <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
