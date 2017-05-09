<%-- 
    Document   : addToCart
    Created on : 2017-4-23, 22:52:01
    Author     : elvis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.mypackage.hello.Commodity"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add to cart</title>
        <link href="./css/search_style.css" rel="stylesheet" />
    </head>
    
        <jsp:include page="header1.jsp" flush="true"/>
        <jsp:useBean id="mybean" scope="page" class="org.mypackage.hello.Commodity" />
        <jsp:useBean id="cart" scope="session" class="org.mypackage.hello.ShopCart" />
      <%
           mybean.setPrice(Float.parseFloat(request.getParameter("price").substring(1)));
           mybean.setName(request.getParameter("name"));
           mybean.setNumber(Integer.parseInt(request.getParameter("number")));
           mybean.setEbook(Integer.parseInt(request.getParameter("ebook")));
           cart.addCommodity(mybean);
            %>
            <div id="div_result">            
        <h1>
           <%= mybean.getName() %>
           
        </h1>
        <h2>
            <div>
                number: <%= mybean.getNumber() %>
            </div>
            <div>
                 total price: <%= mybean.getPrice()*mybean.getNumber() %>
            </div>
            <div>
                <form action="shopCart.jsp" method="POST">
                    <input type="submit" value="Go To Shop Cart" >
                </form>
                

                <form action="index.jsp" method="POST">
                    <input type="submit" value="Go Back To Home Page" >
                </form>
                
                
            </div>
            
            
        </h2>
</div>
        
       <jsp:include page="footer.jsp" flush="true"/>
        
    
</html>
