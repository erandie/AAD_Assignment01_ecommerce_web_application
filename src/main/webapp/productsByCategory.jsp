<%@ page import="java.util.List" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Item" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/25/25
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Products in Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Georgia', cursive;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.7),
                    rgba(0, 0, 0, 0.7)
            ),
            url('https://i.pinimg.com/originals/6b/12/c4/6b12c49e57cc55c3c8f6f5a49b09f561.jpg'); /* Background image */
            background-size: cover;
            background-color: #280101;
            color: white;
            padding: 30px 0;
        }

        h1 {
            font-size: 40px;
            color: #f4f4f4;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 40px;
        }

        .card {
            border: none;
            background: linear-gradient(145deg, #280101 10%, #76513d 100%);
            color: white;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .card-title, .card-text {
            color: #f4f4f4;
        }

        .text-success {
            color: #5ce65c !important;
        }

        .btn {
            border-radius: 20px;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #280101;
            border: 1px solid #76513d;
        }

        .btn-primary:hover {
            background-color: #76513d;
            color: #f4f4f4;
        }

        .btn-success {
            background-color: #5e3f2f;
            border: 1px solid #76513d;
        }

        .btn-success:hover {
            background-color: #76513d;
            color: white;
        }

        .form-control-sm {
            background-color: #280101;
            color: white;
            border: 1px solid #76513d;
        }

        .form-control-sm:focus {
            border-color: #5e3f2f;
            box-shadow: 0 0 5px #5e3f2f;
        }

        .text-danger {
            color: #e74c3c;
        }
    </style>
</head>
<body>
<h1 class="text-center my-4">Products in Category 📦</h1>

<div class="container">
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <%
            List<Item> items = (List<Item>) request.getAttribute("items");
            if (items != null && !items.isEmpty()) {
                for (Item item : items) {
        %>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <% String imagePath = item.getImagePath(); %>
                <img
                        src="<%= request.getContextPath() + "/" + imagePath %>"
                        alt="Product Image"
                        class="card-img-top"
                        style="height: 200px; object-fit: cover;">
                <div class="card-body text-center">
                    <h5 class="card-title text-truncate"><%= item.getName() %></h5>
                    <p class="card-text text-truncate"><%= item.getDescription() %></p>
                    <p class="text-success">Price: $<%= item.getAmount() %></p>
                    <p class="text-secondary">Quantity: <%= item.getQty() %></p>
                    <a href="LoadAllItems?product_id=<%= item.getProduct_id() %>" class="btn btn-info btn-sm mb-2">View Details</a>

                    <!-- Buttons and Quantity Field on Same Line -->
                    <form action="<%= request.getContextPath() %>/CartServlet" method="post" class="d-flex justify-content-between align-items-center mb-2">
                        <input type="hidden" name="product_id" value="<%= item.getProduct_id() %>">
                        <input type="number" name="quantity" value="1" min="1" class="form-control form-control-sm me-2" style="width: 60px;">
                        <button type="submit" class="btn btn-primary btn-sm me-1">Add To Cart</button>
                        <button type="submit" formaction="<%= request.getContextPath() %>/PlaceOrderServlet" class="btn btn-success btn-sm">Place Order</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p class="text-center text-danger">No products found in this category!</p>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
