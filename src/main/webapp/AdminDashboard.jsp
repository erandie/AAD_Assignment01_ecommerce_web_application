<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/18/25
  Time: 11:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home!</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            transition: all 0.3s ease;
            background-color: #280f01;
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

        .category-list {
            list-style-type: none;
            padding: 0;
        }

        .category-list li {
            padding: 8px 0;
        }

        .category-list li a {
            color: #ddd;
            text-decoration: none;
        }

        .category-list li a:hover {
            text-decoration: underline;
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

        .card{
            height: 20vw;
            width: 20vw;
            background-color: saddlebrown;

        }

        .content.blur {
            filter: blur(5px); /* Apply blur effect to content */
        }

        .card-title{
            color: black;
            font-weight: bolder;
        }

        .card-text{
            color: black;
            font-weight: bolder;
        }

        .category-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            color: black;
        }

        .category-list {
            list-style-type: none;
            padding: 0;
        }

        .category-list li {
            padding: 8px 0;
        }

        .category-list li a {
            color: #343a40;
            text-decoration: none;
        }

        .category-list li a:hover {
            text-decoration: underline;
        }

    </style>

</head>
<body>
<div class="sidebar" id="sidebar">
    <a href="javascript:void(0)" class="close-btn" onclick="toggleSidebar()">&times;</a>
    <br><br><br>
    <a href="ItemSave.jsp">Product Management</a><br>
    <a href="CategorySave.jsp">Category Management</a><br>
    <a href="#">Order Management</a><br>
    <a href="UserAuthentication.jsp">User Management</a><br>
    <a href="CategoryView.jsp">View Categories</a><br>
    <a href="ViewProducts.jsp">View Products</a><br>
    <a href="userProfile.jsp">View User Profiles</a><br>

    <ul class="category-list">
        <li><a href="#">Novels</a></li>
        <li><a href="#">Short Books</a></li>
        <li><a href="#">Fiction</a></li>
        <li><a href="#">Science Fiction</a></li>
        <li><a href="#">Romance</a></li>
        <li><a href="#">History</a></li>
        <li><a href="#">Children's Books</a></li>
    </ul>
</div>
<!-- Content -->
<div class="content" id="content">
    <!-- Icon Button -->
    <span class="icon-button" onclick="toggleSidebar()">&#9776;</span>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<script>
    function toggleSidebar() {
        var sidebar = document.getElementById('sidebar');
        var content = document.getElementById('content');
        sidebar.classList.toggle('open');
        content.classList.toggle('blur');
    }
</script>

</body>
</html>
