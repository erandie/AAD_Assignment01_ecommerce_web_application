<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Item" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/21/25
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<form action="LoadAllItems" method="get">
    <h1> Item Table </h1>
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-dark">
            <tr>
                <th>Item ID</th>
                <th>Item Name</th>
                <th>Category</th>
                <th>Description</th>
                <th>Price</th>
                <th>stock_quantity</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Item> items = (List<Item>) request.getAttribute("items");
                if (items != null) {
                    for (Item item : items) {
            %>

            <tr>
                <td> <%= item.getProduct_id()%></td>
                <td> <%= item.getName()%></td>
                <td> <%= item.getCategory()%></td>
                <td> <%= item.getDescription()%></td>
                <td> <%= item.getAmount()%></td>
                <td> <%= item.getQty()%></td>
            </tr>
            <%
                    }
                }
            %>

            </tbody>
        </table>
    </div>
</form>


</body>
</html>
