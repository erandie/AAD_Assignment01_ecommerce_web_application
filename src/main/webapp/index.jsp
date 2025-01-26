<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - E-Commerce</title>

    <style>
        body {
            background-color: #2f1101;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: linear-gradient(
                    rgba(0, 0, 0, 0.6), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.6)
            ),
            url('https://i.pinimg.com/736x/f3/04/b3/f304b3b1c9f9c107f626ade2dce152c9.jpg'); /* Replace with your image URL */
            background-size: cover;
        }

        .video-background{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        #bg-video{
            object-fit: cover;
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }

        .login-container {
            display: flex;
            background-color: #412b1e;
            width: 85vw;
            height: 42vw;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(15, 0, 0, 0.8), 0px 4px 15px rgba(31, 2, 2, 0.8);
        }

        .login-title {
            color: #230000;
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
                    rgba(0, 0, 0, 0.5), /* Dark shadow effect */
                    rgba(0, 0, 0, 0.5)
            ),
            /*url('https://i.pinimg.com/736x/e6/1c/1e/e61c1e4222cebf7829f3d6a893eca8b3.jpg'); !* Replace with your image URL *!*/
            url('https://i.pinimg.com/736x/36/45/ae/3645ae587282a61c55ef57ec57f3e5a4.jpg'); /* Replace with your image URL */
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

        .btn-login {
            background-color: #76513d;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .btn-login:hover {
            background-color: #5a3d28;
        }


    </style>
</head>
<body>

    <div class="login-container">
        <div class="image-container"></div> <!-- Image on the left -->
        <div class="form-container">
            <form action="Login" method="post">
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
                <input type="text" class="form-control" placeholder="Name" name="userName" required>
                <input type="password" class="form-control" placeholder="Password" name="password" required> <br>
                <%--<a href="AdminDashboard.jsp" class="btn btn-login">Login</a>--%>
                <%--<button type="submit" class="btn btn-login">Login</button>--%>
                <a href="AdminDashboard.jsp" class="btn btn-login">Login :)</a>

                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus atque commodi, corporis dolorum ea
                    eius eveniet, explicabo facilis illum incidunt maiores nostrum odit provident quidem sint sit unde!
                    Inventore, quisquam? Lorem ipsum dolor sit amet, <br>consectetur adipisicing elit. Deleniti, provident sed.
                    Accusamus eaque facere labore pariatur praesentium quidem rem repellat ut veniam! Adipisci expedita
                    itaque nam quidem quod tempore, ullam?
                </p>

                <div class="register-link">
                    Don't you have an account? <a href="UserAuthentication.jsp">Register here</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

