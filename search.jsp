<%-- 
    Document   : search
    Created on : Feb 1, 2024, 7:12:29 AM
    Author     : VICTUS HELLO
--%>

<%@page import="registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <h1>Welcome shopping</h1>
        <form action="DispatchServlet">
            Search Value <input type="text" name="txtSearchValue" value="<%=request.getParameter("txtSearchValue")%>"/> </br>
            <input type="submit" name="btAction" value="Search"/>
        </form>
        </br>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCH");
                if (result != null) {//search is found
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>NO.</th>
                    <th>User Name</th>
                    <th>Password</th>
                    <th>Full Name</th>
                    <th>Role</th>        
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (RegistrationDTO dto : result) {
                        String urlRewriting = "DispatchServlet"
                                + "?btAction=delete"
                                + "&pk=" + dto.getUsername()
                                + "&lastSearchValue=" + searchValue;
                %>
                <tr>
                    <td> <%= ++count%>. </td>
                    <td>
                        <%= dto.getUsername()%> 
                    </td>
                    <td>
                        <%= dto.getPassword()%>
                    </td>
                    <td>
                        <%= dto.getFullName()%>
                    </td>
                    <td>
                        <%= dto.isRole()%>
                    </td>    
                    <td>
                        <a href="">Delete</a>
                    </td>
                </tr>                
                <%
                    }//   traverse result to bet each accounts                            
                %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <h2>

            <font color="">
            No record is matched!!!!
            </font>
        </h2>
        <%
                }//end search is not found
            }//search value is null if user access directly
%>
    </body>
</html>
