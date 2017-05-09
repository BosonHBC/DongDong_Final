<div id="header">
    
            <div id="login">
                <%
                    if(session.getAttribute("logined")!= null && session.getAttribute("logined").equals(true)){
                      %> 
                <font class='login_font'>Welcome! <a href='<%=request.getContextPath()%>/userPage.jsp'><%=session.getAttribute("username")%></a> Click <a href='<%=request.getContextPath()%>/JSP_logsigninout/logout.jsp'>here</a> to logout.</font>
                <%  
                    }
                    else{
                        out.println("<font class='login_font'>Welcome to DongDong, please <a href='"+request.getContextPath()+"/JSP_logsigninout/login.jsp'>Log In</a> if you are our member, or <a href='"+request.getContextPath()+"/JSP_logsigninout/signup.jsp'>Sign Up</a> here</font>");
                    }
                %>
            </div>
            <table id ="search">
                
                <tr>
                    <th>
                        <a href ="index.jsp"><img src="<%=request.getContextPath()%>/image/logo.gif" alt = "logo"></a>
                    </th>
                    <th>
                        
                        <form name='Search Form' action="<%=request.getContextPath()%>/searchResult.jsp" method='POST'>
                        <input type='text' name='search_info' />
                        <input type='submit' value='Search' />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                        </form>
                    </th>
                    <div id ="shoppingCart">
                        <th>
                            <a href ="<%=request.getContextPath()%>/shopCart.jsp">
                                <img width ="60" height ="60" src="<%=request.getContextPath()%>/image/shopCartIcon.jpg" alt = "shopCart">
                                <jsp:useBean id="cart" scope="session" class="org.mypackage.hello.ShopCart" />
                                </a>
                        </th>
                        <th ><font class = "shopCart_font">Shopping Cart: <%=cart.getAmount()%></font></th>
                        
                    </div>
                </tr>
            </table>
                 <hr width="1000px" color="#d7d7d7" SIZE=1>
        </div>