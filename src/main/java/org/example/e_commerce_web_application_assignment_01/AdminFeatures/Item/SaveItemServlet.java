package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "SaveItemServlet", value = "/SaveItem")
public class SaveItemServlet extends HttpServlet {
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemName = req.getParameter("item_name");
        String description = req.getParameter("description");
        String categoryId = req.getParameter("category_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);

            String sql = "INSERT INTO products (item_name, description, category_id) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, itemName);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, Integer.parseInt(categoryId));

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                resp.sendRedirect("item_save_success.jsp");
            } else {
                resp.sendRedirect("item_save_fail.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to save item");
        }
    }
}