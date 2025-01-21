package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import org.example.e_commerce_web_application_assignment_01.DTO.Category;

@WebServlet(name = "GetCategoriesServlet", value = "/GetCategories")
public class GetCategoriesServlet extends HttpServlet {
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "Ijse@1234";




    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        List<Category> categories = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);
            String sql = "SELECT category_id, category_name FROM categories";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Category category = new Category(resultSet.getInt("category_id"), resultSet.getString("category_name"));
                categories.add(category);
            }

            Gson gson = new Gson();
            PrintWriter out = resp.getWriter();
            out.print(gson.toJson(categories));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch categories");
        }
    }
}
