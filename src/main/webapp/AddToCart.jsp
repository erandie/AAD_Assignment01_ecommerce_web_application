<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/26/25
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body{
        background-color: red;
    }
</style>

<body>
<h2> Your Cart! </h2>
<table>
    <tr>
        <th> Product Name </th>
        <th> Price </th>
        <th> Quantity </th>
        <th> Total </th>
    </tr>

    <c:forEach var="item" items="${cart}">
        <tr>
            <td>${item.product_name}</td>
            <td>${item.price}</td>
            <td>${item.quantity}</td>
            <td>${item.total_price}</td>
        </tr>
    </c:forEach>
</table>

<form action="<%= request.getContextPath() %>/CartServlet" method="post">
    <input type="hidden" name="action" value="placeOrder">
    <button type="submit" class="btn btn-primary">Place Order</button>
</form>

<h3>Products Available</h3>
<div id="product-list">
    <c:forEach var="item" items="${productList}">
        <div class="product-cart">
            <img src="<%= request.getContextPath() + "/" + item.getImagePath() %>" alt="${item.getName()}" />
            <h4>${item.getName()}</h4>
            <p>${item.getDescription()}</p>
            <p>Price: $${item.getAmount()}</p>
            <p>Quantity: ${item.getQty()}</p>
            <form action="<%= request.getContextPath() %>/CartServlet" method="post">
                <input type="hidden" name="product_id" value="${item.getProduct_id()}" />
                <input type="hidden" name="product_name" value="${item.getName()}" />
                <input type="hidden" name="price" value="${item.getAmount()}" />
                <input type="number" name="quantity" value="1" min="1" />
                <button type="submit" class="btn btn-success" name="action" value="addToCart">Add to Cart</button>
            </form>
        </div>
    </c:forEach>
</div>

</body>
</html>
