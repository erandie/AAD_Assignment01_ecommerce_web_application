package org.example.e_commerce_web_application_assignment_01.AdminFeatures.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.User;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserProfileServlet", value = "/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sql =  "SELECT * FROM user";
        List<User> users = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)) {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                User user = new User(
                        resultSet.getInt("user_id"),
                        resultSet.getString("name"),
                        resultSet.getString("userName"),
                        resultSet.getString("email"),
                        resultSet.getString("role"),
                        resultSet.getString("password"),
                        resultSet.getString("image_path")
                );
                users.add(user);

                req.setAttribute("users", users);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error occurred.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(req, resp);

    }
}