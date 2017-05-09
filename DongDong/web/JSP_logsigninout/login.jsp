<%-- 
    Document   : login
    Created on : Apr 4, 2017, 3:19:59 PM
    Author     : bochhuang2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="<%=request.getContextPath()%>/css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="..\header1.jsp" flush="true"/>
         <div id="log_in" style="margin: 0 auto; width: 300px">
            <br>
            <font>Please fill in the user name and password:</font><br/><br/>
            
            <form name="loginForm" action="dologin.jsp" method="POST">
                
                
                <%
                    String username = "";
                    if(request.getAttribute("username")!= null && request.getAttribute("username")!= ""&& request.getAttribute("username")!= "null"){
                        username = (String)request.getAttribute("username");
                    }
                    out.println("Username:<input type='text' name='username' value= '"+username+"' maxlength ='15'/><br/>");
                    if(request.getAttribute("error") != null){
                        out.println(request.getAttribute("error"));
                    }
                    out.println("<br/>Password:<input type='password' name='password' value='' maxlength ='16'/><br/>");
                %><br/>
                
                <input type="submit" value="Login"/>
                <a href="signup.jsp"><font>Sign Up Now!</font></a>
            </form>
        </div>
        <jsp:include page="..\footer.jsp" flush="true"/>
    </body>
</html>
