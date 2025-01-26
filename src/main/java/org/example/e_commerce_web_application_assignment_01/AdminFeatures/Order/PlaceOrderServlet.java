package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.Item;
import org.example.e_commerce_web_application_assignment_01.DTO.User;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PlaceOrderServlet", value = "/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database_name";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "your_password";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = getUsers();
        List<Item> products = getProducts();

        req.setAttribute("users", users);
        req.setAttribute("products", products);

        // Forward the request to PlaceOrder.jsp
        req.getRequestDispatcher("/PlaceOrder.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id = req.getParameter("user_id");
        String product_id = req.getParameter("product_id");
        String quantity = req.getParameter("quantity");

        // Process the order logic (e.g., save the order to the database)
        placeOrder(user_id, product_id, quantity);

        // Redirect to order success page
        resp.sendRedirect("orderSuccess.jsp");
    }

    private List<User> getUsers() {
        List<User> users = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT user_id, username FROM users WHERE role = 'User'")) {
            while (rs.next()) {
                int user_id = rs.getInt("user_id");
                String username = rs.getString("username");
                users.add(new User(user_id, username, rs.getString("email"), rs.getString("phone_number"), rs.getString("role")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    private List<Item> getProducts() {
        List<Item> products = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT product_id, product_name, price FROM products")) {
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                double price = rs.getDouble("price");
                products.add(new Item(product_id, product_name, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private void placeOrder(String user_id, String product_id, String quantity) {
        // Assume you have an Order class and order table to store the order details
        // Also, update the stock quantity of the product after the order is placed

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Start a transaction
            conn.setAutoCommit(false);

            // Insert the order into the orders table
            String orderSQL = "INSERT INTO orders (user_id, product_id, quantity) VALUES (?, ?, ?)";
            try (PreparedStatement orderStmt = conn.prepareStatement(orderSQL)) {
                orderStmt.setString(1, user_id);
                orderStmt.setString(2, product_id);
                orderStmt.setString(3, quantity);
                orderStmt.executeUpdate();
            }

            // Update the stock quantity of the product
            String updateStockSQL = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE product_id = ?";
            try (PreparedStatement updateStockStmt = conn.prepareStatement(updateStockSQL)) {
                updateStockStmt.setString(1, quantity);
                updateStockStmt.setString(2, product_id);
                updateStockStmt.executeUpdate();
            }

            // Commit transaction
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            // Rollback transaction if something goes wrong
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                conn.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
        }
    }
}
