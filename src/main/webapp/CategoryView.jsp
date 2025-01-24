<%@ page import="java.util.List" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Category" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/22/25
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <%--<style>
        body{
            background-color: #280101;
        }

        .container{
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 50px;
            /*max-width: 100%;*/
            overflow-x: hidden;
        }

        .card{
            flex: 1 1 calc(25% - 20px);
            margin: 10px;
            box-sizing: border-box;
            width: 300px;
        }

        .card-text{
            width: 90%;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: -250px; /* Initially hidden to the left */
            height: 100%;
            width: 250px;
            background-color: #343a40;
            padding-top: 20px;
            transition: left 0.3s ease-in-out;
            z-index: 9999;
        }

        .sidebar.open {
            left: 0; /* Sidebar slides in */
        }

        .sidebar a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            display: block;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .icon-button {
            font-size: 30px;
            cursor: pointer;
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 10000;
        }

        /* Content styles */
        .content {
            transition: filter 0.3s ease;
            padding: 20px;

        }

        .content.blur {
            filter: blur(5px); /* Apply blur effect */
        }

        .sidebar-open .sidebar {
            filter: blur(5px);
        }


    </style>--%>

</head>

<body>
<form action="LoadCategoriesToUserSide" method="get">
    <div class="container">

        <%
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null && !categories.isEmpty()) {
                for (Category category : categories) {
            %>

        <div class="card">
            <%
                String imagePath = category.getImage_path();
                if (imagePath != null && !imagePath.isEmpty()) {
            %>

            <img src="<%= request.getContextPath() + "/" + imagePath%>" alt="category image">
            <%
                } else {
            %>

            <p> No Image Available!</p>

            <%
                }
            %>

            <div class="card-body">
                <h5 class="card-title"><%= category.getDescription()%></h5>
                <p class="card-text"> <%= category.getDescription()%></p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <%
        } else {
            System.out.println("No categories found in jsp!!");
    %>

    <p> No Categories Foundieeessss!!!!!!!!!</p>

    <%
        }
    %>

</form>
</body>
</html>
