<%@ page import="java.util.List" %>
<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(145deg, #280101, #76513d);
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .container {
            padding: 50px;
            max-width: 1200px;
            margin: auto;
        }

        .card {
            background-color: #280101;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        .card img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            object-fit: cover;
            height: 200px;
            width: 100%;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bolder;
            color: #76513d; /* Use your requested color for title */
        }

        .card-text {
            font-size: 1.1rem;
            color: #fff; /* White text for the content */
            margin-bottom: 10px;
        }

        .card a {
            color: #fff;
            background-color: #280101; /* Button with a dark red color */
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .card a:hover {
            background-color: #76513d; /* Lighter brown on hover */
        }

        .no-image {
            color: #fff;
            font-size: 1.1rem;
            text-align: center;
            padding: 20px;
            background-color: #444;
            border-radius: 10px;
        }

        .container h1 {
            text-align: center;
            color: #76513d;
            margin-bottom: 30px;
        }

        .card-body p {
            margin-bottom: 15px;
        }

        .user-image {
            width: 50px; /* Set a small width for the image */
            height: 50px; /* Set the height to match the width */
            object-fit: cover; /* Ensure the image doesn't stretch */
            border-radius: 50%; /* Optionally, make the image circular */
            margin-right: 15px; /* Space between the image and text */
            display: inline-block; /* Align it to the left */
        }


    </style>
</head>
<body>

<form action="UserProfileServlet" method="get">
    <div class="container">

        <h1>All Users</h1>

        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
        %>

        <div class="card">
            <%
                String imagePath = user.getImagePath();
                if (imagePath != null && !imagePath.isEmpty()) {
            %>
            <img src="<%= request.getContextPath() + "/" + imagePath%>" alt="User Image">
            <%
            } else {
            %>
            <div class="no-image">No Image Available!</div>
            <%
                }
            %>

            <div class="card-body">
                <h5 class="card-title"><%= user.getName() %></h5>
                <p class="card-text"><strong>Username:</strong> <%= user.getUserName() %></p>
                <p class="card-text"><strong>Email:</strong> <%= user.getEmail() %></p>
                <p class="card-text"><strong>Role:</strong> <%= user.getRole() %></p>
                <a href="#" class="btn btn-primary">View Profile</a>
            </div>
            <div class="d-flex justify-content-end mt-3">
                <a href="LoadAllUsers" class="btn btn-link text-decoration-none" style="color: white; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">All Users</a>
                <a href="update_user" class="btn btn-link text-decoration-none" style="color: white; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Update Users</a>
                <a href="delete_user" class="btn btn-link text-decoration-none" style="color: white; font-size: 18px; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);">Delete Users</a>
            </div>
        </div>

        <%
            }
        } else {
        %>

        <p>No Users found!</p>

        <%
            }
        %>

    </div>
</form>

</body>
</html>
