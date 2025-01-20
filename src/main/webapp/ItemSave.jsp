<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/20/25
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #280101;
            padding-bottom: 100px;
            padding-top: 50px;
        }

        .card {
            background-color: #592222;
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
            color: white;
        }

        .form-control {
            border-radius: 20px;
            transition: transform 0.2s ease;
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

<div style="color: red"> <%=error%></div>

<%
    }
%>

<div id="manageItems" class="container active mt-5">
    <div class="card">
        <form action="ItemSave" method="post">

            <h2 class="text-center">Manage Items</h2> <br>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name-inputt-02" class="itemName">Item Name</label>
                    <input id="name-inputt-02" type="text" class="form-control" name="product_name" placeholder="Item Name">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="desc-inputt-02" class="itemId">Item Description</label>
                    <input id="desc-inputt-02" type="text" class="form-control" placeholder="Item Description" name="description">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="quantity-02" class="quantity">Quantity</label>
                    <input id="quantity-02" type="text" class="form-control" placeholder="Quantity" name="stock_quantity">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="unitPrice-02" class="unitPrice">Unit Price</label>
                    <input id="unitPrice-02" type="text" class="form-control" placeholder="Unit Price" name="price">
                </div>
            </div>

            <div class="row">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" name="category_id">
                        Product Category
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">1</a></li>
                        <li><a class="dropdown-item" href="#">2</a></li>
                        <li><a class="dropdown-item" href="#">3</a></li>
                    </ul>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-3">
                <button id="item_getAll_btn" type="button" class="btn btn-secondary btn-sm custom-btn">Get All</button>
                <div class="row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
            <div class="table-responsive mt-4">
                <table class="table table-dark table-striped-columns">
                    <thead>
                    <tr>
                        <th scope="col">Item ID</th>
                        <th scope="col">Item Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Unit Price</th>
                        <th scope="col">Actions</th>
                    </tr>
                    </thead>
                    <tbody id="itemTableBody"></tbody>
                </table>
                <p class="placeholder-glow">
                    <span class="placeholder col-12"></span>
                </p>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
