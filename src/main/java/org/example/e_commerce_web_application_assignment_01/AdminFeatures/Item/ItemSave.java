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
import java.sql.SQLException;

@WebServlet(name = "ItemSaveServlet", value = "/ItemSave")
public class ItemSave extends HttpServlet {

    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_name = request.getParameter("product_name");
        String categoryIdString = request.getParameter("category_id");
        int category_id = 0;
        if (categoryIdString != null && !categoryIdString.isEmpty()) {
            try {
                category_id = Integer.parseInt(categoryIdString);
            } catch (NumberFormatException e) {
                // Log error or handle it as needed
                response.sendRedirect("ItemSave.jsp?message=Invalid category ID!");
                return;
            }
        }
        String description = request.getParameter("description");
        String priceString = request.getParameter("price");
        Double price = 0.0;
        if (priceString != null && !priceString.isEmpty()) {
            try {
                price = Double.valueOf(priceString);
            } catch (NumberFormatException e) {
                // Log error or handle it as needed
                response.sendRedirect("ItemSave.jsp?message=Invalid price!");
                return;
            }
        }

        String stockQuantityString = request.getParameter("stock_quantity");
        int stock_quantity = 0;
        if (stockQuantityString != null && !stockQuantityString.isEmpty()) {
            try {
                stock_quantity = Integer.parseInt(stockQuantityString);
            } catch (NumberFormatException e) {
                // Log error or handle it as needed
                response.sendRedirect("ItemSave.jsp?message=Invalid stock quantity!");
                return;
            }
        }


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql = "INSERT INTO products (product_name, category_id, description, price, stock_quantity) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product_name);
            preparedStatement.setInt(2, category_id);
            preparedStatement.setString(3, description);
            preparedStatement.setDouble(4, price);
            preparedStatement.setInt(5, stock_quantity);
            int effectedRowCount = preparedStatement.executeUpdate();
            if (effectedRowCount > 0) {
                response.sendRedirect(
                        "ItemSave.jsp?message=Product Added Successfully! :)"
                );
            } else {
                response.sendRedirect(
                        "ItemSave.jsp?message=Failed To Add Product!! :("
                );
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
