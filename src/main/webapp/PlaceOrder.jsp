<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        body {
            background-image: linear-gradient(135deg, #280101 20%, #76513d 80%);
            color: white;
            font-family: Arial, sans-serif;
        }

        #placeOrder {
            margin-top: 50px;
        }

        .card {
            background-color: #280101;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #76513d;
            font-size: 2rem;
        }

        .form-label {
            color: white;
        }

        .form-control {
            border: 2px solid #76513d;
            border-radius: 5px;
            background-color: #2a2a2a;
            color: white;
        }

        .form-control:focus {
            border-color: #76513d;
            background-color: #333;
        }

        .btn-primary {
            background-color: #76513d;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #5a3d28;
        }

        .btn-secondary {
            background-color: black;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .btn-secondary:hover {
            background-color: #333;
        }

        .table-dark {
            background-color: #280101;
        }

        .table-dark th, .table-dark td {
            color: white;
        }

        .table-dark tbody tr:nth-child(odd) {
            background-color: #3a2a2a;
        }

        .table-dark tbody tr:nth-child(even) {
            background-color: #4b3a3a;
        }

        .table-dark td, .table-dark th {
            padding: 12px;
        }

        .table-responsive {
            margin-top: 20px;
        }

        .d-flex .btn {
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div id="placeOrder" class="container my-4">
    <h2 class="text-center">Place Order</h2>
    <div class="card p-3">
        <form id="po-form" action="PlaceOrderServlet" method="POST">
            <!-- Order Details Section -->
            <div class="row g-3">
                <div class="col-md-6">
                    <label for="orderId" class="form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Order ID</label>
                    <input type="text" class="form-control" id="orderId" name="orderId" required style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
                <div class="col-md-6">
                    <label for="orderDate" class="form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Date</label>
                    <input type="date" class="form-control" id="orderDate" name="orderDate" required style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
            </div>

            <!-- Customer Selection Section -->
            <div class="row g-3 align-items-center mt-4">
                <div class="col-md-4">
                    <label id="customerId" for="customers" class="form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">User ID</label>
                    <select id="customers" name="user_id" class="form-select" style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                        <option value="" selected>Select Customer ID</option>
                        <!-- Dynamically populate customers list from backend -->
                        <c:forEach var="customer" items="${user}">
                            <option value="${user.user_id}">${user.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-8">
                    <input id="customerName" type="text" class="form-control" placeholder="Customer Name" readonly style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
            </div>

            <!-- Item Selection Section -->
            <div class="row g-3 align-items-center mt-4">
                <div class="col-md-4">
                    <label for="itemsId" class="form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Product ID</label>
                    <select id="itemsId" name="itemId" class="form-select" required style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                        <option value="" selected>Select Item ID</option>
                        <!-- Dynamically populate items list from backend -->
                        <c:forEach var="item" items="${items}">
                            <option value="${item.id}">${item.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-4">
                    <input id="itemName" type="text" class="form-control" placeholder="Item Name" readonly style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
                <div class="col-md-4">
                    <input id="itemUnitPrice" type="text" class="form-control" placeholder="Unit Price" readonly style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
            </div>

            <div class="row g-3 align-items-center mt-4">
                <div class="col-md-4">
                    <input id="itemQtyOnHand" type="text" class="form-control" placeholder="Quantity on Hand" readonly style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
                <div class="col-md-4">
                    <input id="itemQty" type="number" class="form-control" placeholder="Quantity" name="quantity" min="1" required style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
                <div class="col-md-4">
                    <button id="addToCartBtn" type="button" class="btn btn-success w-100">Add to Cart</button>
                </div>
            </div>

            <!-- Order Summary Table -->
            <div class="table-responsive mt-4">
                <table id="orderSummaryTable" class="table table-dark table-striped">
                    <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody id="poTableBody"></tbody>
                </table>
            </div>

            <!-- Total Amount Section -->
            <div class="row mt-4 align-items-center">
                <div class="col-md-4">
                    <label for="totalAmount" class="form-label" style="color: #634343; font-size: 20px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Total Amount:</label>
                </div>
                <div class="col-md-8">
                    <input id="totalAmount" type="text" class="form-control" placeholder="Total: 0.00" readonly style="background-color: #76513d; border: none; box-shadow: 2px 2px 5px rgba(3, 5, 8, 0.4); color: #280101FF">
                </div>
            </div>

            <!-- Place Order and Dashboard Buttons -->
            <div class="d-flex justify-content-between mt-4">
                <button type="submit" id="placeOrderBtn" class="btn btn-primary">Place Order</button>
                <a href="dashBoard.html" class="btn btn-secondary">Dashboard</a>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>
