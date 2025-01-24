<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/19/25
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Authentication</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #280101;
        }
        .container {
            margin: 100px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .register-title {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            width: 100%;
            /*background-color: brown;*/

        }
        .row {
            display: flex;
            justify-content: space-between;
        }
        .col-md-6 {
            width: 48%; /* Adjust the width for each column */
        }

        .img-fluid{
            height: 30vw;
            width: 50vw;
        }

        .row{
            width: 95%;
        }

    </style>

</head>
<body>

<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>

<%
    if (message != null) {
%>

<div style="color: green"> <%=message%> </div>

<% } %>

<%
    if (error != null) {
%>

<div style="color: red"> <%=error%> </div>
<%
    }
%>

<%
    // Assuming 'userId' is available, for example from session or URL parameter
    String name = (String) session.getAttribute("name");

    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "Ijse@1234");
    String sql = "SELECT image_path FROM user WHERE name = ?";
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, name);
    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
        byte[] imageBytes = resultSet.getBytes("image_path");
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
%>
<img src="data:image/jpeg;base64,<%= base64Image %>" alt="Profile Image" />
<%
    }
%>


<div class="container">
    <div class="row">
        <!-- Form on the left -->
        <div class="col-md-6">
            <form action="UserAuthentication" method="post" enctype="multipart/form-data">
                <h1 class="register-title">Register</h1>

                <!-- Name -->
                <div class="row mb-3">
                    <label for="name" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                    </div>
                </div>

                <!-- Username -->
                <div class="row mb-3">
                    <label for="username" class="col-sm-2 col-form-label">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                </div>

                <!-- Email -->
                <div class="row mb-3">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="staticEmail" name="email" placeholder="Enter your email" required>
                    </div>
                </div>

                <!-- Role -->
                <div class="row mb-3">
                    <label for="specificSizeSelect" class="col-sm-2 col-form-label">Role</label>
                    <div class="col-sm-10">
                        <select class="form-select" id="specificSizeSelect" name="role" required>
                            <option selected>Choose...</option>
                            <option value="1">Admin</option>
                            <option value="2">User</option>
                            <option value="3">Guest</option>
                        </select>
                    </div>
                </div>

                <!-- Password -->
                <div class="row mb-3">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Enter your password" required>
                    </div>
                </div>

                <!-- Confirm Password -->
                <div class="row mb-3">
                    <label for="inputPassword-2" class="col-sm-2 col-form-label">Re-enter Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword-2" placeholder="Re-enter your password" required>
                    </div>
                </div>

                <%--Profile Image--%>
                <div class="row mb-3">
                    <label for="profileImage" class="col-sm-2 col-form-label">Profile Image</label>
                    <div class="col-sm-10">
                        <input type="file" class="form-control" id="profileImage" name="profileImage" required>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="d-flex justify-content-end mt-3">
                    <a href="LoadAllUsers"> All Users </a>
                    <a href="update_user"> Update Users </a>
                    <a href="delete_user"> Delete Users </a>
                    <a href="UserProfileServlet"> view Users </a>

                    <div class="row">
                        <div class="col-sm-10 offset-sm-2">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Image on the right -->
        <div class="col-md-6">
            <img src="https://i.pinimg.com/736x/7d/7b/c7/7d7bc7c585304f69c3c767d04e7935ea.jpg" alt="Image" class="img-fluid">
        </div>

    </div>
</div>

</body>
</html>
