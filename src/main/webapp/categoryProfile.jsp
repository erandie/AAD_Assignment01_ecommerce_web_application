<%@ page import="java.util.List" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.Categories" %><%--
  Created by IntelliJ IDEA.
  User: erandi
  Date: 1/24/25
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<form action="CategoryProfileServlet" method="get">

    <div class="container">

        <%
            List<Categories> categoriesList = (List<Categories>) request.getAttribute("categories");
            if (categoriesList != null && !categoriesList.isEmpty()) {
                for (Categories categories : categoriesList){
            %>

        <div class="card">

            <%
                String imagePath = categories.getImage_path();
                if (imagePath != null && !imagePath.isEmpty()) {
            %>

            <img src="<%= request.getContextPath() + "/" + imagePath%>" alt="category Image">
            <%
                } else {
            %>

            <p> No image available!</p>

            <%
                }
            %>

            <div class="card-body">
                <h5 class="card-title"><%= categories.getCategory_name()%></h5>
                <p class="category-text"><%= categories.getDescription()%></p>
                <a href="ProductByCategoryServlet?category_id=<%= categories.getCategory_id() %>" class="btn btn-primary">View Products</a>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <%
        } else {
    %>

    <p> No categories Found! </p>

    <%
        }
    %>

</form>

</body>
</html>
