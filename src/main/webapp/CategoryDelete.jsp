<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/22/25
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Georgia', cursive;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.8),
                    rgba(0, 0, 0, 0.8)
            ),
            url('https://i.pinimg.com/736x/55/79/bd/5579bd7189fac6e978d6ca84fd563931.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-color: #280101;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            background: linear-gradient(85deg, #280101 10%, #5e3f2f 100%);
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 30px;
            width: 100%;
            max-width: 600px;
        }

        .register-title {
            text-align: center;
            margin-bottom: 20px;
            color: #280101;
            font-size: 40px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
        }

        .form-control {
            border-radius: 20px;
            background-color: #76513d;
            color: #280101;
            box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4);
            border: none;
            transition: all 0.3s ease;

        }

        .form-control:focus {
            background-color: #76513d;
            color: #280101;
            transform: scale(1.03);
            box-shadow: 0 0 5px 2px rgba(3, 5, 8, 0.4);
        }

        .btn-primary {
            background-color: #280101;
            border-color: #280101;
            font-size: 18px;
            color: white;
            border-radius: 15px;
        }

        .btn-primary:hover {
            background-color: #5e3f2f;
            border-color: #5e3f2f;
        }

        .row {
            display: flex;
            justify-content: space-between;
            width: 95%;
        }

        a {
            color: #280101;
            font-size: 18px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);
            text-decoration: none;
            margin-left: 10px;
        }

        a:hover {
            color: #5e3f2f;
        }

        h2 {
            color: #280101;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
            font-weight: bold;
            font-family: 'Georgia', cursive;
            font-size: 40px;
        }

        .row .col-sm-10 {
            display: flex;
            justify-content: flex-end;
        }

        .btn-container {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
    </style>

</head>
<body>
<div class="container">

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


<form action="delete_category" method="post">
    <h1 class="register-title">Delete Category</h1>

    <!-- Name -->
    <div class="row mb-3">
        <label for="id" class="col-sm-2 col-form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">ID</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="id" name="category_id" placeholder="Enter user ID:">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10 offset-sm-2">
            <a href="LoadCategoryTable" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);"> All Categories </a>
            <button type="submit" class="btn btn-primary">Delete Category</button>

        </div>
    </div>

</form>

</body>
</html>
