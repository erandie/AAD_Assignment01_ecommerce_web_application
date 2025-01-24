<%@ page import="java.util.List" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/24/25
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<form action="UserProfileServlet" method="get">
    <div class="container">

        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
            %>

        <div class="card">

            <%
                String imagePath = user.getImagePath();
                if (imagePath != null && !imagePath.isEmpty()) {
            %>
            <img src="<%= request.getContextPath() + "/" + imagePath%>" alt="user Image">
            <%
                } else {
            %>
            <p> No Image Available!</p>
            <%
                }
            %>

            <div class="card-body">
                <h5 class="card-title"><%= user.getName()%></h5>
                <p class="card-text"><%= user.getUserName()%></p>
                <p class="card-text"><%= user.getEmail()%></p>
                <p class="card-text"><%= user.getRole()%></p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <%
        } else {
    %>

    <p> No Users found!</p>

    <%
        }
    %>

</form>
</body>
</html>
<%--<body>

<form action="LoadCategoryServlet" method="get">
    <div class="container mt-5">
        <h1>All Users</h1>

        <c:if test="${not empty users}">
            <div class="row">
                <c:forEach var="user" items="${users}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <div class="card-header">
                                <h2>${user.name}</h2>
                            </div>
                            <div class="card-body">
                                <p><strong>Username:</strong> ${user.userName}</p>
                                <p><strong>Email:</strong> ${user.email}</p>
                                <p><strong>Role:</strong> ${user.role}</p>
                                <c:if test="${not empty user.imagePath}">
                                    <img src="${user.imagePath}" alt="Profile Picture" class="img-thumbnail" style="max-width: 200px;">
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${empty users}">
            <p>No users found.</p>
        </c:if>
    </div>
</form>


</body>

--%>