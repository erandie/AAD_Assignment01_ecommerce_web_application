package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.Categories;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryProfileServlet", value = "/CategoryProfileServlet")
public class CategoryProfileServlet extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sql = "SELECT * FROM categories";
        List<Categories> categories = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)){
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Categories categories1 = new Categories(
                        resultSet.getInt("category_id"),
                        resultSet.getString("category_name"),
                        resultSet.getString("description"),
                        resultSet.getString("image_path")
                );

                categories.add(categories1);


            }

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database Error Occurred!");
        }

        req.setAttribute("categories", categories);
        RequestDispatcher dispatcher = req.getRequestDispatcher("categoryProfile.jsp");
        dispatcher.forward(req, resp);

    }
}

































