 <div id="login" style="margin: 0 auto; width: 300px">
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