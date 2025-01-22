<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/21/25
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<form action="LoadCategoryTable" method="get">
    <h1> Category Table </h1>

    <div>
        <label for="searchTerm">Search by Category Name:</label>
        <input type="text" id="searchTerm" name="searchTerm" placeholder="Enter category name">
        <button type="submit">Search</button>
    </div>

</form>

    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-dark">
            <tr>
                <th>Category ID</th>
                <th>Category Name</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                if (categories != null) {
                    for (Category category : categories) {
            %>

            <tr>
                <td> <%= category.getCategoryId()%></td>
                <td> <%= category.getCategoryName()%></td>
                <td> <%= category.getDescription()%></td>
            </tr>
            <%
                    }
                }
            %>

            </tbody>
        </table>
    </div>


</body>
</html>
