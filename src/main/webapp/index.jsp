<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - E-Commerce</title>

    <style>
        body {
            background-color: #280f01;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            display: flex;
            background-color: #674330;
            width: 85vw;
            height: 42vw;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(21, 21, 21, 0.4), 0px 4px 15px rgba(235, 229, 229, 0.3);
        }

        .login-title {
            color: #280101;
            font-family: 'Georgia', serif;
            font-size: 60px;
            font-weight: bold;
            text-align: center;
            position: absolute;
            top: 80px;
            left: 50%;
            transform: translateX(-50%);
            width: 100%;
        }

        .image-container {
            width: 40%; /* Adjust the image container width */
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.6), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.6)
            ),
            url('https://i.pinimg.com/736x/e6/1c/1e/e61c1e4222cebf7829f3d6a893eca8b3.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            border-radius: 20px 0 0 20px; /* Rounded left corners */
        }

        .form-container {
            width: 60%;
            padding: 30px;
            display: flex;
            justify-content: flex-end;
            flex-direction: column;
            align-items: flex-end; /* Aligns child elements (form controls) to the right */
            text-align: right;
        }

        .form-control {
            height: 2vw;
            background-color: #2f0901;
            border: none;
            border-radius: 20px;
            margin-bottom: 15px;
            text-align: center;
            width: 30vw;
            align-self: flex-end; /* Aligns each input field to the right */
        }


        .btn-login {
            background-color: #3d0f07;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
            width: 10vw;
            color: black;
        }

        .btn-login:hover {
            background-color: #54250b;
            color: white;
        }

        .register-link {
            margin-top: 15px;
            font-size: 14px;
            color: #f1873b;

        }

        .register-link a {
            color: #280101;
            text-decoration: none;

        }

        .register-link a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="login-container">
    <div class="image-container"></div> <!-- Image on the left -->
    <div class="form-container">
        <form>
            <div class="login-title">Novel Escape Book Shop</div>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus atque commodi, corporis dolorum ea
                eius eveniet, explicabo facilis illum incidunt maiores nostrum odit provident quidem sint sit unde!
                Inventore, quisquam? Lorem ipsum dolor sit amet, <br> Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Accusamus atque commodi, corporis dolorum ea
                eius eveniet, explicabo facilis illum incidunt maiores nostrum odit provident quidem sint sit unde!
                Inventore, quisquam? Lorem ipsum dolor sit amet, <br>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                Accusamus atque commodi, corporis dolorum ea
                eius eveniet, explicabo facilis illum incidunt maiores nostrum odit provident quidem sint sit unde!
                Inventore, quisquam? Lorem ipsum dolor sit amet, <br>consectetur adipisicing elit. Deleniti, provident sed.
                Accusamus eaque facere labore pariatur praesentium quidem rem repellat ut veniam! Adipisci expedita
                itaque nam quidem quod tempore, ullam? <br>Lorem ipsum dolor sit amet,
            </p>
            <input type="text" class="form-control" placeholder="Name" required>
            <input type="password" class="form-control" placeholder="Password" required> <br>
            <a href="CustomerSave.jsp" class="btn btn-login">Login</a>
            <button type="submit" class="btn btn-login" href="Customer.jsp">Login</button>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus atque commodi, corporis dolorum ea
                eius eveniet, explicabo facilis illum incidunt maiores nostrum odit provident quidem sint sit unde!
                Inventore, quisquam? Lorem ipsum dolor sit amet, <br>consectetur adipisicing elit. Deleniti, provident sed.
                Accusamus eaque facere labore pariatur praesentium quidem rem repellat ut veniam! Adipisci expedita
                itaque nam quidem quod tempore, ullam?
            </p>

            <div class="register-link">
                Don't you have an account? <a href="AdminDashboard.jsp">Register here</a>
            </div>

        </form>
    </div>
</div>
</body>
</html>

