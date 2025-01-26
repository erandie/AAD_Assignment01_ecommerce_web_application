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
            font-family: 'Georgia', cursive;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.6), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.6)
            ),
            url('https://i.pinimg.com/736x/55/79/bd/5579bd7189fac6e978d6ca84fd563931.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-color: #280101;
            padding-bottom: 100px;
            padding-top: 50px;
        }

        .card {

            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            /*background-image: linear-gradient(
                    rgba(0, 0, 0, 0.7), !* Dark shadow effect *!
                    rgba(0, 0, 0, 0.7)
            ),
            url("https://i.pinimg.com/736x/64/81/d7/6481d7247f080803e72b9b599a873484.jpg");*/
            background: linear-gradient(85deg, #280101 10%, #5e3f2f 100%);
            color: white;
            border-radius: 10px;
            padding: 25px 50px 50px;
            margin: 0 70px;
        }

        .table {
            padding-top: 150px;
            border-radius: 10px;
        }

        h2 {
            color: #280101;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
            font-weight: bold;
            font-family: 'Georgia', cursive; /* Change 'Arial' to your preferred font */
            font-size: 40px;
        }

        .form-control {
            border-radius: 20px;
            transition: transform 0.2s ease;

            /*background-color: #343a40;*/
            /*opacity: 85%;*/
        }

        .custom-btn {
            height: 35px;
            transition: transform 5s ease-in-out;
        }

        .custom-btn:active {
            transform: scale(3);
            transition-duration: 1s;
        }

        .form-control:focus {
            transform: scale(1.03); /* Slightly increase size */
            background-color: #5e3f2f;
        }

        .placeholder-glow {
            margin-top: -22px;
            opacity: 40%;
        }

        .container {
            display: none;
        }

        .container.active {
            display: block;
        }

        .dropdown-toggle{
            background-color: #54250b;
            width: 20vw;
        }

        /* Style the Choose File button */
        input[type="file"]::file-selector-button {
            background-color: #76513d;
            color: #280101;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4);
            cursor: pointer;
        }

        /* Optional: Hover effect for the button */
        input[type="file"]::file-selector-button:hover {
            background-color: #5e3f2f;
        }

        .btn.btn-primary {
            color: white; /* White text color */
            background-color: #280101; /* Background color of the button */
            border-color: #280101; /* Border color of the button */
            font-size: 18px;
        }

        .btn.btn-primary:hover {
            background-color: #5e3f2f; /* Hover background color */
            border-color: #5e3f2f; /* Hover border color */
        }

        .form-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            padding: 20px;
        }

        .form-container .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-container label {
            font-size: 20px;
            color: #634343;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);
        }

        .form-container input,
        .form-container select {
            background-color: #76513d;
            border: none;
            box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4);
            color: #280101;
            padding: 10px;
            font-size: 16px;
            margin-top: 5px;
        }

        .form-container button {
            background-color: #280101;
            color: white;
            padding: 10px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .form-container .action-links a {
            margin-right: 15px;
            font-size: 16px;
            color: #280101;
        }

        .form-container .action-links a:hover {
            text-decoration: underline;
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


<div id="manageItems" class="container active mt-5">
    <div class="card">
        <form action="UserAuthentication" method="post" enctype="multipart/form-data">
            <h2 class="text-center">User Authentication :)</h2>

            <div class="form-container">
                <!-- Name and Username -->
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                    <label for="username" style="color: #280101">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>

                <!-- Email and Role -->
                <div class="form-group">
                    <label for="staticEmail">Email</label>
                    <input type="email" class="form-control" id="staticEmail" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="specificSizeSelect" style="color: #280101">Role</label>
                    <select class="form-select" id="specificSizeSelect" name="role" required>
                        <option selected>Choose...</option>
                        <option value="1">Admin</option>
                        <option value="2">User</option>
                        <option value="3">Guest</option>
                    </select>
                </div>

                <!-- Password and Re-enter Password -->
                <div class="form-group">
                    <label for="inputPassword">Password</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Enter your password" required>
                </div>
                <div class="form-group">
                    <label for="inputPassword-2" style="color: #280101">Re-enter Password</label>
                    <input type="password" class="form-control" id="inputPassword-2" placeholder="Re-enter your password" required>
                </div>

                <!-- Profile Image -->
                <div class="form-group">
                    <label for="profileImage">Profile Image</label>
                    <input type="file" class="form-control" id="profileImage" name="profileImage" required>
                </div>
            </div>

            <!-- Action Links and Submit Button -->
            <div class="d-flex justify-content-end mt-3">
                <a href="LoadAllUsers" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">All Users</a>
                <a href="update_user" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Update Users</a>
                <a href="delete_user" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Delete Users</a>
                <a href="UserProfileServlet" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">User Profiles</a>

                <div class="row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary" style="font-size: 18px;">Save User</button>
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

</body>
</html>
