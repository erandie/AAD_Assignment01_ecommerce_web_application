<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/25/25
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
    if (user ==  null || !"User".equals(user.getRole())){
        response.sendRedirect("userDashboard.jsp");
    }
%>

</body>
</html>
