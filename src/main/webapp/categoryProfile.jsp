<%@ page import="java.util.List" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Categories" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/24/25
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Georgia', serif;
            background-image: linear-gradient(135deg, #280101 20%, #76513d 80%);
            color: white;
            padding: 30px 0;
        }

        h1 {
            color: #f4f4f4;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
            font-size: 40px;
            margin-bottom: 40px;
        }

        .card {
            background: linear-gradient(145deg, #280101 10%, #76513d 90%);
            color: white;
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
        }

        .card-title, .card-text {
            color: #280101;
            font-weight: bold;
        }

        .text-muted {
            color: #d3d3d3 !important;
        }

        .btn-primary {
            background-color: #280101;
            border: 1px solid #76513d;
            border-radius: 20px;
            font-size: 14px;
        }

        .btn-primary:hover {
            background-color: #76513d;
            color: white;
            border-color: #f4f4f4;
        }

        .card-img-top {
            border-bottom: 2px solid #76513d;
        }

        .container {
            margin-top: 20px;
        }

        .no-image {
            height: 200px;
            background-color: rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 14px;
            color: #d3d3d3;
            border-bottom: 2px solid #76513d;
        }
    </style>
</head>
<body>
<form action="CategoryProfileServlet" method="get">
    <div class="container">
        <h1 class="text-center">Our Categories</h1>
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <%
                List<Categories> categoriesList = (List<Categories>) request.getAttribute("categories");
                if (categoriesList != null && !categoriesList.isEmpty()) {
                    for (Categories categories : categoriesList) {
            %>
            <div class="col">
                <div class="card h-100">
                    <%
                        String imagePath = categories.getImage_path();
                        if (imagePath != null && !imagePath.isEmpty()) {
                    %>
                    <img
                            src="<%= request.getContextPath() + "/" + imagePath %>"
                            alt="Category Image"
                            class="card-img-top"
                            style="height: 200px; object-fit: cover;">
                    <%
                    } else {
                    %>
                    <div class="no-image">No image available</div>
                    <%
                        }
                    %>
                    <div class="card-body text-center">
                        <h5 class="card-title text-truncate"><%= categories.getCategory_name() %></h5>
                        <p class="card-text text-muted text-truncate"><%= categories.getDescription() %></p>
                        <a href="ProductByCategoryServlet?categoryId=<%= categories.getCategory_id() %>" class="btn btn-primary">View Products</a>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center text-danger">No categories found!</p>
            <%
                }
            %>
        </div>
    </div>
</form>
</body>
</html>
