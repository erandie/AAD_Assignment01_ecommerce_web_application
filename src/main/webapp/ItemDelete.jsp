<%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/22/25
  Time: 1:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #280101;
        }

        .register-title {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            width: 100%;
            /*background-color: brown;*/

        }
        .row {
            display: flex;
            justify-content: space-between;
            width: 95%;
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

<div style="color: red"> <%=error%> </div>
<%
    }
%>


<form action="delete_item" method="post">
    <h1 class="register-title">Delete Items</h1>

    <!-- Name -->
    <div class="row mb-3">
        <label for="id" class="col-sm-2 col-form-label">ID</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="id" name="product_id" placeholder="Enter user ID:">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-primary">Delete</button>
            <a href="LoadAllItems"> All Categories </a>
        </div>
    </div>

</form>

</body>
</html>
