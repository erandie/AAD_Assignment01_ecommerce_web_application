package org.example.e_commerce_web_application_assignment_01.AdminFeatures.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.User;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

        User user = null;
        try {
            user = validateUser(userName, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (user != null) {
           req.getSession().setAttribute("user", user);

           if ("Admin".equals(user.getRole())) {
               resp.sendRedirect("AdminDashboard.jsp");
           } else {
               resp.sendRedirect("userDashboard.jsp");
           }
       } else {
           req.setAttribute("errorMessage", "Invalid username or password!");
           req.getRequestDispatcher("index.jsp").forward(req, resp);
       }
    }

    private User validateUser(String userName, String password) throws SQLException {
        Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);
        String sql = "SELECT * FROM user WHERE userName = ? AND password = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1, userName);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return new User(
                        resultSet.getString("userName"),
                        resultSet.getString("password")
                );
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
        }

    }



