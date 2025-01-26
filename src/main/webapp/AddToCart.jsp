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

<body>
<h2> Your Cart! </h2>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${cart}">
        <tr>
            <td>${item.productName}</td>
            <td>$${item.price}</td>
            <td>${item.quantity}</td>
            <td>$${item.total_price}</td>
            <td>
                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#cartModal"
                        data-product-id="${item.productId}" data-product-name="${item.productName}"
                        data-product-price="${item.price}" data-product-quantity="${item.quantity}">
                    Update
                </button>
                <form action="RemoveProductFromCart" method="post" class="d-inline-block">
                    <input type="hidden" name="productId" value="${item.productId}">
                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                </form>
            </td>
        </tr>
    </c:forEach>

    </tbody>

</table>



</body>
</html>
