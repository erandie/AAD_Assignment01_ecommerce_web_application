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
    <title>Home</title>

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

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <a href="javascript:void(0)" class="close-btn" onclick="toggleSidebar()">&times;</a>
    <br><br><br>
    <a href="#">User Authentication</a><br>
    <a href="#">Product Browsing</a><br>
    <a href="#">Shopping Cart</a><br>
    <a href="#">Order Placement</a><br>
    <a href="#">User Profile Management</a>
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

    <!-- Category Sections -->
    <div class="container">
        <div class="category-title">Featured Categories</div> <br>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="https://i.pinimg.com/736x/83/47/b7/8347b70de4b0d4f21c1c8ce84e4ab2d6.jpg" height="355vw" class="card-img-top" alt="Novels">
                    <div class="card-body">
                        <h5 class="card-title">Novels</h5>
                        <p class="card-text">Explore the best novels in various genres.</p>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>

            </div>

            <div class="col-md-4">
                <div class="card">
                    <img src="https://i.pinimg.com/736x/ee/e9/46/eee9467794410c4ea6684cfa84dfac0d.jpg" height="355vw" class="card-img-top" alt="Short Books">
                    <div class="card-body">
                        <h5 class="card-title">Short Books</h5>
                        <p class="card-text">Perfect for readers who are short on time.</p>
                    </div>
                </div>
                <br>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://i.pinimg.com/736x/3b/38/b6/3b38b634e90a07127c10f51960484f9b.jpg" height="355vw" class="card-img-top" alt="Fiction">
                    <div class="card-body">
                        <h5 class="card-title">Fiction</h5>
                        <p class="card-text">Dive into fictional worlds and adventures.</p>
                    </div>
                </div>
                <br>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://i.pinimg.com/736x/83/47/b7/8347b70de4b0d4f21c1c8ce84e4ab2d6.jpg" height="355vw" class="card-img-top" alt="Novels">
                    <div class="card-body">
                        <h5 class="card-title">Fiction</h5>
                        <p class="card-text">Dive into fictional worlds and adventures.</p>
                    </div>
                </div>
                <br>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://i.pinimg.com/736x/83/47/b7/8347b70de4b0d4f21c1c8ce84e4ab2d6.jpg" height="355vw" class="card-img-top" alt="Novels">
                    <div class="card-body">
                        <h5 class="card-title">Fiction</h5>
                        <p class="card-text">Dive into fictional worlds and adventures.</p>
                    </div>
                </div>
                <br>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <img src="https://i.pinimg.com/736x/83/47/b7/8347b70de4b0d4f21c1c8ce84e4ab2d6.jpg" height="355vw" class="card-img-top" alt="Novels">
                    <div class="card-body">
                        <h5 class="card-title">Fiction</h5>
                        <p class="card-text">Dive into fictional worlds and adventures.</p>
                    </div>
                </div>
                <br>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS & Dependencies -->
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
