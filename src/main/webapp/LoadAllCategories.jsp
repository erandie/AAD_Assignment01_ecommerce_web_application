<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/21/25
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Georgia', cursive;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.8), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.8)
            ),
            url('https://i.pinimg.com/736x/55/79/bd/5579bd7189fac6e978d6ca84fd563931.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-color: #280101;
            padding-bottom: 100px;
            padding-top: 50px;
        }

        .card {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            background: linear-gradient(85deg, #280101 10%, #5e3f2f 100%);
            color: white;
            border-radius: 10px;
            padding: 25px 50px 50px;
            margin: 0 70px;
        }

        .table {
            margin-top: 20px;
            width: 100%;
        }

        h1 {
            color: black;
            font-size: 40px;
            text-align: center;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
        }

        .table-responsive {
            margin-top: 20px;
        }

        .table {
            border-radius: 10px;
        }

        th, td {
            text-align: center;
            font-size: 18px;
        }

        .table th {
            background-color: #76513d;
            color: #280101;
        }

        .table td {
            background-color: #5e3f2f;
            color: #e9baba;
        }

        .table-hover tbody tr:hover {
            background-color: #4b2d1d;
        }

        .table-bordered th, .table-bordered td {
            border: 1px solid #280101;
        }

        .container {
            max-width: 100%;
            display: flex;
            justify-content: center;
            padding-top: 30px;
        }

        .table-container {
            width: 80%;
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

<form action="LoadCategoryTable" method="get">
<div class="container">
    <div class="table-container card">
        <h1> All the Books Categories Have :) 📚 </h1> <br>
        <div>
            <label for="searchTerm" style="color: #f4f4f4; font-size: 20px; background-color: #280101; margin-right: 10px;">Search by Category Name:</label>
            <input type="text" id="searchTerm" name="searchTerm" placeholder="Enter category name"
                   style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); border-radius: 20px; color: #280101FF">
            <button type="submit" class="btn btn-primary" style="font-size: 18px;">Search</button>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Description</th>
                    </tr>
                </thead>
            <tbody>
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                if (categories != null) {
                    for (Category category : categories) {
            %>

            <tr>
                <td> <%= category.getCategory_id()%></td>
                <td> <%= category.getCategory_name()%></td>
                <td> <%= category.getDescription()%></td>
            </tr>
            <%
                    }
                }
            %>

            </tbody>
        </table>
    </div>

        <div class="d-flex justify-content-end mt-3">
            <a href="CategorySave" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);"> Save Categories :)</a>
            <a href="update_category" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Update Categories :)</a>
            <a href="delete_category" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Remove Categories :)</a>
        </div>
     </div>
    </div>
</form>

</body>
</html>
