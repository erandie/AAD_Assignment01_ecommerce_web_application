<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/21/25
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<form action="LoadAllUsers" method="get">
    <h1> User Table </h1>


    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Image</th>
            </tr>
            </thead>
            <tbody>

            <%
                List<User> users = (List<User>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (User user : users) {
            %>


            <tr>
                <td> <%= user.getUser_id()%></td>
                <td> <%= user.getName()%></td>
                <td> <%= user.getUserName()%></td>
                <td> <%= user.getEmail()%></td>
                <td> <%= user.getRole()%></td>
                <td>
                    <%
                        String imagePath = user.getImagePath();
                        if (imagePath != null && !imagePath.isEmpty()) {
                    %>
                    <img src="<%= request.getContextPath() + "/" + imagePath%>" alt="user image">
                    <%
                    } else {
                    %>
                    <p> No Image Available!</p>
                    <%
                        }
                    %>
                </td>
                   <%-- <c:forEach var="users" items="${users}">
                        <c:if test="${not empty user.imagePath}">
                            <img src="${pageContext.request.contextPath}/${user.imagePath}" alt="Profile Picture" class="img-thumbnail" style="max-width: 100px;">
                        </c:if>
                    </c:forEach>
                </td>
--%>



            </tr>
            <%
                    }
            %>
            </tbody>
        </table>

        <%
            } else {
        %>
        <p>No Users found.</p>
        <%
            }
        %>

    </div>
</form>


</body>
</html>
