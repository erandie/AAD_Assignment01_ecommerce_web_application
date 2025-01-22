<%--
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

    <style>
        body{

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


    </style>

</head>
<body>

<div class="sidebar" id="sidebar">
    <a href="javascript:void(0)" class="close-btn" onclick="toggleSidebar()">&times;</a>
    <br><br><br>
    <a href="ItemSave">Product Management</a><br>
    <a href="#">Category Management</a><br>
    <a href="#">Order Management</a><br>
    <a href="#">User Management</a><br>
</div>

<div class="content" id="content">
    <!-- Icon Button -->
    <span class="icon-button" onclick="toggleSidebar()">&#9776;</span>
</div>

<form class="form">
    <h1 style="text-align: center"> Categories </h1>
    <div class="container">
        <div class="card">
            <img src="https://i.pinimg.com/736x/a2/69/4e/a2694ef516357a338fdcb7a0857a438c.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/474x/c4/f6/49/c4f649ee577787fb43d201eee6f5b89a.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/474x/5d/49/c8/5d49c826dbfdfa3910abf3171da195a7.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/736x/5a/13/49/5a1349d181e0ca5987d7853175bb56cf.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/736x/5a/13/49/5a1349d181e0ca5987d7853175bb56cf.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/474x/fa/76/9a/fa769acb780d7d0b230f1ad0348a7430.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/474x/fa/76/9a/fa769acb780d7d0b230f1ad0348a7430.jpg" height="250px" width="255px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
            <img src="https://i.pinimg.com/474x/fa/76/9a/fa769acb780d7d0b230f1ad0348a7430.jpg" height="250px" width="250px" class="card-img-top" alt="..."/>
            <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>


    </div>

</form>

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
