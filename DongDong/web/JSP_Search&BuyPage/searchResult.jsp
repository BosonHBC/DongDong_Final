<%-- 
    Document   : response
    Created on : Apr 4, 2017, 11:54:44 AM
    Author     : bochhuang2
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
    </head>
    <body>
        <jsp:useBean id="mybean" scope="page" class="org.mypackage.hello.SearchHandler" />
        <jsp:setProperty name="mybean" property="search_info" />
        <%
            if(mybean.getSearch_info() == null || mybean.getSearch_info().equalsIgnoreCase("")){
                response.sendRedirect("../index.jsp");
            }
        %>
        <h1>Hello World, <%=mybean.getSearch_info() %>!</h1>
        
    </body>
</html>
