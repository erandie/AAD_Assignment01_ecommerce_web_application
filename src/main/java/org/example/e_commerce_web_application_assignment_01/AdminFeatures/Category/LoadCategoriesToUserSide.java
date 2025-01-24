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

@WebServlet(name = "LoadCategoriesToUserSide", value = "/LoadCategoryServlet")
public class LoadCategoriesToUserSide extends HttpServlet {
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "Ijse@1234";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = getCategoriesFromDatabase();

        System.out.println("Categories fetched: " + categories.size());
        for (Category category : categories) {
            System.out.println("Category: " + category.getCategoryName());
        }


        req.setAttribute("categories", categories);

        RequestDispatcher dispatcher = req.getRequestDispatcher("CategoryView.jsp");
        dispatcher.forward(req, resp);
    }

    private List<Category> getCategoriesFromDatabase() {
        List<Category> categories = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)){
            System.out.println("Database Connected Successfully!");

            String sql = "SELECT category_name, description, image_path FROM categories";

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery()){

                    while (resultSet.next()) {
                       String category_name = resultSet.getString("category_name");
                       String description = resultSet.getString("description");
                       String image_path = resultSet.getString("image_path");
                       categories.add(new Category(category_name, description, image_path));

                        System.out.println("Fetched: " + category_name + ", " + description + ", " + image_path);
                    }
                }

            } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return categories;
    }
}

































