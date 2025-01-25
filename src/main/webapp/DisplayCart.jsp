<%@ page import="org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart.CartHandle" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.CartItem" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/25/25
  Time: 2:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    CartHandle cart = (CartHandle) session.getAttribute("cart");
    if (cart != null && !cart.getItems().isEmpty()){
%>

<table>
    <tr>
        <th> Product </th>
        <th> quantity </th>
        <th> Price </th>
        <th> Action </th>
    </tr>

    <%
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            CartItem item = entry.getValue();
    %>

    <tr>
        <td><%= item.getProduct_name()%></td>
        <td>
            <form action="UpdateCartServlet" method="post">
                <input type="number" name="quantity" value="<%= item.getQuantity()%>" min="1">
                <input type="hidden" name="product_id" value="<%= item.getProduct_id() %>">
                <button type="submit"> Update </button>
            </form>
        </td>
        <td><%= item.getPrice() * item.getQuantity() %></td>
        <td>
            <form action="RemoveProductFromCart" method="post">
                <input type="hidden" name="product_id" value="<%= item.getProduct_id()%>">
                <button type="submit"> Remove </button>
            </form>
        </td>
    </tr>

    <%
        }
    %>

</table>

<h3> Total: <%= cart.getTotalPrice() %></h3>
<a href="checkout.jsp">Proceed To Checkout!</a>

<%
    } else {
%>

<p> Your cart is empty</p>

<%
    }
%>

</body>
</html>
