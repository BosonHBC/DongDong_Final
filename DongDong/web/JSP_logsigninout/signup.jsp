<%-- 
    Document   : signup
    Created on : Apr 4, 2017, 3:20:26 PM
    Author     : bochhuang2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
       <link href="<%=request.getContextPath()%>/css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="..\header1.jsp" flush="true"/>
        <div id="dosignup" style="margin: 0 auto; width: 330px">
            <br>
            <font>Please fill in the user name and password:</font><br/><br/>
            
            <form name="SignUpForm" action="dosignup.jsp" method="POST">
                <%
                    String username = "";
                    if(request.getAttribute("username")!= null && request.getAttribute("username")!= ""&& request.getAttribute("username")!= "null"){
                        username = (String)request.getAttribute("username");
                    }
                    out.println("Create an Username: <input type='text' name='username' value= '"+username+"' maxlength ='15'/><br/>");
                    if(request.getAttribute("error") != null){
                        out.println(request.getAttribute("error"));
                    }
                    %>
                    <br/>Create a Password: <input type='password' name='password' value='' maxlength ='16'/><br/>
                    <br/>Confirm your Password: <input type='password' name='password_c' value='' maxlength ='16'/><br/>
                    <br/><input type="submit" value="Sign Up"/>
            </form>
                    </div>
                    
                    <jsp:include page="..\footer.jsp" flush="true"/>
    </body>
</html>
