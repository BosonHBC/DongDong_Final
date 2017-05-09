<%-- 
    Document   : index
    Created on : Mar 27, 2017, 1:06:56 PM
    Author     : bochhuang2
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index_Dong Dong</title>
        <link href="./css/index_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header1.jsp" flush="true"/>
        
        <div id="body">
            <br>
            <table>
                <tr>
                    <td>
                        <%
                    if(session.getAttribute("logined")!= null && session.getAttribute("logined").equals(true)){
                        %>
                         <td style="text-align: center" width="1000" height="300">
                            Welcome to Dong Dong! Search any book you like, we can offer you!
                        </td>
                    <%
                    }
                    else{
                      %> 
                       <font>Please fill in the user name and password:</font><br/><br/>
            
            <form name="loginForm" action="./JSP_logsigninout/dologin.jsp" method="POST">
                
                
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
                <a href="./JSP_logsigninout/signup.jsp"><font>Sign Up Now!</font></a>
                
                
            </form>
                </td>
                    <td style="text-align: center" width="700">
                        Welcome to Dong Dong! Search any book you like, we can offer you!
                    </td>
                    
                    <%}%>
                    
                    
                </tr>
            </table>
        </div>
        
        
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
