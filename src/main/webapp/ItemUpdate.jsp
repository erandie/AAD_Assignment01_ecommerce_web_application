<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/21/25
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Georgia', cursive;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.6), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.6)
            ),
            url('https://i.pinimg.com/736x/55/79/bd/5579bd7189fac6e978d6ca84fd563931.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-color: #280101;
            padding-bottom: 100px;
            padding-top: 50px;
        }

        .card {

            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            /*background-image: linear-gradient(
                    rgba(0, 0, 0, 0.7), !* Dark shadow effect *!
                    rgba(0, 0, 0, 0.7)
            ),
            url("https://i.pinimg.com/736x/64/81/d7/6481d7247f080803e72b9b599a873484.jpg");*/
            background: linear-gradient(85deg, #280101 10%, #5e3f2f 100%);
            color: white;
            border-radius: 10px;
            padding: 25px 50px 50px;
            margin: 0 70px;
        }

        .table {
            padding-top: 150px;
            border-radius: 10px;
        }

        h2 {
            color: #280101;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
            font-weight: bold;
            font-family: 'Georgia', cursive; /* Change 'Arial' to your preferred font */
            font-size: 40px;
        }

        .form-control {
            border-radius: 20px;
            transition: transform 0.2s ease;
            /*background-color: #343a40;*/
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

        /* Style the Choose File button */
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
        <form action="Item_Update" method="post">

            <h2 class="text-center">Update Book Details :)</h2> <br>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="name-inputt-01" class="itemID" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Item ID</label>
                    <input id="name-inputt-01" type="text" class="form-control" name="product_id" placeholder="Item ID"
                           style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="name-inputt-02" class="itemName" style="color: #280101; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Item Name</label>
                    <input id="name-inputt-02" type="text" class="form-control" name="product_name" placeholder="Item Name"
                           style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101">
                </div>
            </div>

            <div class="row g-2 align-items-center mt-4">
                <div class="col-md-6 mb-3">
                    <label for="desc-inputt-02" class="itemId" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Item Description</label>
                    <input id="desc-inputt-02" type="text" class="form-control" placeholder="Item Description" name="description"
                           style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="quantity-02" class="quantity" style="color: #280101; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Quantity</label>
                    <input id="quantity-02" type="text" class="form-control" placeholder="Quantity" name="stock_quantity"
                           style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101">
                </div>
            </div>

            <div class="row g-2 align-items-center mt-3">
                <!-- Category and Unit Price Side by Side -->
                <div class="col-md-6">
                    <label for="unitPrice-02" class="unitPrice" style="color: #76513d; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Unit Price</label>
                    <input id="unitPrice-02" type="text" class="form-control" placeholder="Unit Price" name="price"
                           style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101">
                </div>

                <div class="col-md-6 mb-3">
                    <label for="profileImage" class="col-form-label" style="color: #280101FF; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Profile Image</label>
                    <input type="file" class="form-control" id="profileImage" name="profileImage"
                           style="background-color: #76513d; color: #280101; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4);">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label id="categoryId" for="categoryDropdown" class="form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Category: </label>
                    <select id="categoryDropdown" aria-label="Default select example" class="form-select" name="category_id" style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101"></select>
                </div>
            </div>

            <div class="d-flex justify-content-end mt-3">
                <a href="LoadAllItems" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">All Items</a>
                <a href="delete_item" class="btn btn-link text-decoration-none" style="color: #280101; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Delete Items</a>
                <div class="row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary" style="font-size: 18px;">Update Book :)</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="lib/jquery-3.7.1.min.js"></script>

<script>
    async function loadCategories() {
        const response = await fetch("GetCategories");
        const categories = await response.json();

        const dropdown = document.getElementById("categoryDropdown");
        dropdown.innerHTML = "<option value=''>Select a Category</option>";

        categories.forEach(category => {
            const option = document.createElement("option");
            option.value = category.category_id;
            option.textContent = category.category_name;
            dropdown.appendChild(option);
        });
    }

    window.onload = loadCategories;
</script>

</body>
</html>
