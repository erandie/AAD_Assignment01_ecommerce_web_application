package org.example.e_commerce_web_application_assignment_01.sketch;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.Category;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoadCategoriesToUserSide", value = "/LoadCategoriesToUserSide")
public class LoadCategoriesToUserSide extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sql = "SELECT * FROM categories";
        List<Category> categories = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)){
            System.out.println("connected to database!");
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println("query executed successfully!!");

            while (resultSet.next()) {
                Category category = new Category(
                        resultSet.getInt("category_id"),
                        resultSet.getString("category_name"),
                        resultSet.getString("description"),
                        resultSet.getString("image_path")
                );

                System.out.println("Category loaded! " + category.getCategory_name());
                categories.add(category);

            }

            System.out.println("Total categories loaded! " + categories.size());
            req.setAttribute("categories", categories);

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error occurred.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("CategoryView.jsp");
        dispatcher.forward(req, resp);

    }
}

































