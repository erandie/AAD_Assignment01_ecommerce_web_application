<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/21/25
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Category</title>
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

        .card {
            background: linear-gradient(85deg, #280101 10%, #5e3f2f 100%);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            color: white;
            border-radius: 10px;
            padding: 25px 50px 50px;
            margin: 0 70px;
        }

        .table {
            padding-top: 150px;
            color: red;
            border-radius: 10px;
        }

        h2 {
            color: #280101;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
            font-weight: bold;
            font-family: 'Georgia', cursive;
            font-size: 40px;
        }

        .form-control {
            background-color: #76513d;
            color: #280101;
            transform: scale(1.03);
            box-shadow: 0 0 5px 2px rgba(3, 5, 8, 0.4);
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

    </style>

</head>
<body>

<div id="manageItems" class="container active mt-5">
    <div class="card">

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

        <div style="color: red"> <%=error%></div>

        <%
            }
        %>


        <form action="update_category" method="post">

            <h2 class="text-center">Update Categories :)</h2> <br>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name-inputt-02" class="itemName" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Category ID</label>
                    <input id="name-inputt-01" type="text" class="form-control" name="category_id" placeholder="Category ID"
                           style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="name-inputt-02" class="itemName" style="color: #280101; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Category Name</label>
                    <input id="name-inputt-02" type="text" class="form-control" name="category_name" placeholder="Category Name" style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="desc-inputt-02" class="itemId" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Category Description</label>
                    <input id="desc-inputt-02" type="text" class="form-control" placeholder="Category Description" name="description" style="background-color: #76513d; color: #280101; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4);">
                </div>

            </div>

            <div class="d-flex justify-content-end mt-3">
                <a href="LoadCategoryTable" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);"> All Categories </a> <br>
                <a href="delete_category" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);"> Delete Categories </a>
                <a href="CategoryProfileServlet" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);"> view Categories </a>
                <div class="row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary" style="font-size: 18px;">Update Category :)</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
