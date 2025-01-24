package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Category;

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

@WebServlet(name = "LoadCategoryTable", value = "/LoadCategoryTable")
public class LoadCategoryTable extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = new ArrayList<>();

        String searchTerm = req.getParameter("searchTerm");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql;
            if (searchTerm != null && !searchTerm.isEmpty()) {
                // If searchTerm is provided, search categories by name
                sql = "SELECT * FROM categories WHERE category_name LIKE ?";
            } else {
                // If no searchTerm is provided, retrieve all categories
                sql = "SELECT * FROM categories";
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            if (searchTerm != null && !searchTerm.isEmpty()) {
                statement.setString(1, "%" + searchTerm + "%");
            }
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Category category = new Category(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString("image_path"));

                categories.add(category);
            }

            req.setAttribute("categories", categories);

            RequestDispatcher dispatcher = req.getRequestDispatcher("LoadAllCategories.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
