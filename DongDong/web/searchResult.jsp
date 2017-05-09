<%-- 
    Document   : response
    Created on : Apr 4, 2017, 11:54:44 AM
    Author     : bochhuang2
--%>

<%@page import="org.mypackage.hello.Commodity"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.String, java.lang.StringBuffer" %>
<%@page import="javax.naming.Context, javax.naming.InitialContext" %>
<%@page import="java.sql.Connection, javax.sql.DataSource" %>
<%@page import="java.sql.ResultSet, java.sql.Statement" %>
<%@page import="java.sql.SQLException, javax.naming.NamingException" %>
<%@page import="org.mypackage.hello.SearchResult"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
        <link href="./css/search_style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="header1.jsp" flush="true"/>
        <jsp:useBean id="mybean" scope="page" class="org.mypackage.hello.SearchHandler" />
         
        
        <%
            
            mybean.setSearch_info(request.getParameter("search_info"));
            if(mybean.getSearch_info()!=" "){   // not null
                SearchResult[] sr = new SearchResult[1];
                // data base
                int amount = 0;
                 try {
                    Context initCtx = new InitialContext();
                    Context envCtx = (Context)initCtx.lookup("java:comp/env");
                    DataSource ds = (DataSource)envCtx.lookup("jdbc/book");
                    Connection con = ds.getConnection();
                    
                    String keyWord = mybean.getSearch_info();
                    String sql = "SELECT * FROM [book] WHERE [b_name] LIKE ?";
                    
                    PreparedStatement pstmt = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                    
                    
                    pstmt.setString(1,"%" + keyWord + "%");
                    
                    //PreparedStatement pstmt = con.prepareStatement("INSERT INTO [login_tb] ([username], [password],[role]) VALUES (?, ?, ?)");
                    //pstmt.setString(1, inputUsername);
                    
                    
                    ResultSet rs = pstmt.executeQuery();
                    
                    rs.last();
                    amount = rs.getRow();
                    rs.beforeFirst();
                // while loop
                    
                    int temp = 0;
                    
                    if(amount>0){
                        sr = new SearchResult[amount];
                        while(rs != null && rs.next() != false){
                            sr[temp] = new SearchResult();
                            sr[temp].setAuthor(rs.getString("B_AUTHOR"));
                            sr[temp].setImgUrl(rs.getString("B_COVER"));
                            sr[temp].setIntroduce(rs.getString("B_INTRO"));
                            sr[temp].setPrice(rs.getFloat("B_PRICE"));
                            sr[temp].setPublisher(rs.getString("B_PULISHER"));
                            sr[temp].setTitle(rs.getString("B_NAME"));
                            sr[temp].setType(rs.getInt("B_TYPE"));
                            temp ++;
                        }
                        if (rs != null) {
                            rs.close();
                        }
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    }
            
                 }catch (NamingException e) {
                %>
                    <div style='color: red'><%= e.toString() %></div>
                <%
            }catch (SQLException e) {
                %>
                    <div style='color: red'><%= e.toString() %></div>
                <%
            }
            %>
            <div id="div_result">
                <h3><%=mybean.getSearch_info() %> Total <%=amount%> books satisfy the requirement</h3>
            
            <%
                 if(amount>0){
                    for(int i = 0;i<sr.length;i++){
            %>
            
            <table id="wholeResultTable">
                <tr>
                    <td>
                        <a href ="index.jsp"><img class="reslut_img" src="<%=sr[i].getImgUrl()%>" alt = "<%=sr[i].getTitle()%>"></a>
                    </td>
                    <td valign="top">
                        <table id="table_result">
                            <tr>
                                <td class="text_title">
                                <a href="./JSP_ProductPage/userProductPage.jsp"><%=sr[i].getTitle()%></a>
                                </td>
                                <%
                                if(session.getAttribute("logined")!= null && session.getAttribute("role").equals(0)){
                                %>
                                <td class="text_title">
                                    <a href="checkBook.jsp">Edit</a>
                                </td>
                                <%
                                }
                                %>
                            </tr>
                            <tr>
                                <td class="text_price">
                                <%=sr[i].getPrice()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <%=sr[i].getAuthor()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <%=sr[i].getPublisher()%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <%=sr[i].getIntroduce()%>
                                </td>
                            </tr>
                            <tr valign="bottom">
                                <td >
                                    <jsp:useBean id="cart" scope="session" class="org.mypackage.hello.ShopCart" />
                                   
                                    
                                  
                                    <form action="addToCart.jsp" method="POST">
                                        <input type="hidden" name="ebook" value="<%=sr[i].getType()%>" />
                                        <input type="hidden" name="price" value="<%=sr[i].getPrice()%>" />
                                        <input type="hidden" name="name" value="<%=sr[i].getTitle()%>" />
                                        <input type="text" name="number"value="1"/>
                                        <input type="submit" name="add" value="Add To Shop Cart" />
                                        
                                    </form>
                                        
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <hr width="1000px" color="#d7d7d7" SIZE=1>
            
            <%
                    }
                 }
            %>
            
            </div>
            <%
                 
            }
            else{
            %>
            <h5 style="text-align: center">Invalid Search! Try again.</h5>
            <%
            }
            
        %>
        
         <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
