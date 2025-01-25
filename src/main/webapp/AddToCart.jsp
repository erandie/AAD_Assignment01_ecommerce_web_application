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
    <link rel="stylesheet" href="styles.css">
</head>
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
        <td>${item.product_name}</td>
        <td>${item.price}</td>
        <td>${item.quantity}</td>
        <td>${item.total_price}</td>
    </c:forEach>
</table>

<form action="CartServlet" method="post">
    <input type="hidden" name="action" value="placeOrder">
    <button type="submit"> Place Order </button>
</form>

<h3> Products </h3>
<div id="product-list">

</div>

</body>
</html>
