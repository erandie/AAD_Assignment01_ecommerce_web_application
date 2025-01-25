<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/26/25
  Time: 12:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Place Your Order</h1>
<form action="placeOrderServlet" method="post">
    <label for="customerId">Customer ID:</label>
    <input type="text" id="customerId" name="customerId" required><br><br>

    <label for="orderItems">Order Items (Format: productId:quantity, comma-separated):</label>
    <input type="text" id="orderItems" name="orderItems" required><br><br>

    <label for="totalPrice">Total Price:</label>
    <input type="number" id="totalPrice" name="totalPrice" step="0.01" required><br><br>

    <button type="submit">Place Order</button>
</form>
</body>
</html>
