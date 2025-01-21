<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %>
<%@ page import="java.util.List" %><%--
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


<div class="container">
    <div class="row">
        <!-- Form on the left -->
        <div class="col-md-6">
            <form action="UserAuthentication" method="post">
                <h1 class="register-title">Register</h1>

                <!-- Name -->
                <div class="row mb-3">
                    <label for="name" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
                    </div>
                </div>

                <!-- Username -->
                <div class="row mb-3">
                    <label for="username" class="col-sm-2 col-form-label">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
                    </div>
                </div>

                <!-- Email -->
                <div class="row mb-3">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="staticEmail" name="email" placeholder="Enter your email">
                    </div>
                </div>

                <!-- Role -->
                <div class="row mb-3">
                    <label for="specificSizeSelect" class="col-sm-2 col-form-label">Role</label>
                    <div class="col-sm-10">
                        <select class="form-select" id="specificSizeSelect" name="role">
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
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Enter your password">
                    </div>
                </div>

                <!-- Confirm Password -->
                <div class="row mb-3">
                    <label for="inputPassword-2" class="col-sm-2 col-form-label">Re-enter Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword-2" placeholder="Re-enter your password">
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="d-flex justify-content-end mt-3">
                    <button id="item_getAll_btn" type="button" class="btn btn-secondary btn-sm custom-btn" onclick="navigateToUsersPage()">Get All</button>

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

<script>
    function navigateToUsersPage() {
        window.location.href = '/LoadAllUsers'; // Replace '/users' with the actual path to your "Load All Users" page.
    }
</script>


</body>
</html>
