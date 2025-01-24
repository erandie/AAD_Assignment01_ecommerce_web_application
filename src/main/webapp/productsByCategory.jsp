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
    <title>Title</title>
</head>
<body>
<h1> Product in category</h1>

<%
    List<Item> items = (List<Item>) request.getAttribute("items");
    if (items != null && !items.isEmpty()) {
        for (Item item : items) {
%>

<div class="product-cart">
    <img src="<%= request.getContextPath() + "/" + item.getImagePath()%>" alt="product name">
    <h2><%= item.getName() %></h2>
    <p> <%= item.getDescription()%></p>
    <p> Price: $<%= item.getAmount() %></p>
    <p> Quantity: <%= item.getQty() %></p>
    <a href="LoadAllItems.jsp?product_id=<%= item.getProduct_id() %>"> View Details</a>

</div>

<%
    }
    } else {
%>

<p> No products found in this category!</p>

<%
    }
%>

</body>
</html>
