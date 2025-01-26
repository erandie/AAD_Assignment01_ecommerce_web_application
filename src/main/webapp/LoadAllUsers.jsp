<%@ page import="org.example.e_commerce_web_application_assignment_01.DTO.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Georgia', cursive;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.6), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.6)
            ),
            url('https://i.pinimg.com/736x/55/79/bd/5579bd7189fac6e978d6ca84fd563931.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-color: #280101;
            padding-bottom: 100px;
            padding-top: 50px;
            align-items: center;
        }

        .card {
            box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            background: linear-gradient(85deg, #280101 10%, #5e3f2f 100%);
            color: white;
            border-radius: 10px;
            padding: 25px 50px 50px;
            margin: 0 70px;
            align-items: center;
        }

        .table {
            margin-top: 20px;
            width: 100%;
        }

        h1 {
            color: black;
            font-size: 40px;
            text-align: center;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(241, 239, 239, 0.4);
        }

        .table-responsive {
            margin-top: 20px;
            width: 80%;
        }

        .table {
            border-radius: 10px;
        }

        th, td {
            text-align: center;
            font-size: 18px;
        }

        .table th {
            background-color: #76513d;
            color: #280101;
        }

        .table td {
            background-color: #5e3f2f;
            color: #e9baba;
        }

        .table-hover tbody tr:hover {
            background-color: #4b2d1d;
        }

        .table-bordered th, .table-bordered td {
            border: 1px solid #280101;
        }

        .container {
            max-width: 100%;
            display: flex;
            justify-content: center;
            padding-top: 30px;
        }

        .table-container {
            width: 80%;
        }

        .d-flex {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .btn-link {
            color: #280101;
            font-size: 18px;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4);
        }

        .btn-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<form action="LoadAllUsers" method="get">
    <div class="container">

        <div class="table-container card">
            <h1> All Users List </h1>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Image</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<User> users = (List<User>) request.getAttribute("users");
                        if (users != null) {
                            for (User user : users) {
                    %>

                    <tr>
                        <td> <%= user.getUser_id() %></td>
                        <td> <%= user.getName() %></td>
                        <td> <%= user.getUserName() %></td>
                        <td> <%= user.getEmail() %></td>
                        <td> <%= user.getRole() %></td>
                        <td>
                            <%
                                String imagePath = user.getImagePath();
                                if (imagePath != null && !imagePath.isEmpty()) {
                            %>
                            <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="user image" class="img-thumbnail" style="max-width: 100px;">
                            <%
                            } else {
                            %>
                            <p>No Image Available!</p>
                            <%
                                }
                            %>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-end mt-3">
                <a href="User_Update" class="btn btn-link text-decoration-none">Update Users</a>
                <a href="delete_user" class="btn btn-link text-decoration-none">Delete Users</a>
            </div>

        </div>
    </div>
</form>

</body>
</html>
