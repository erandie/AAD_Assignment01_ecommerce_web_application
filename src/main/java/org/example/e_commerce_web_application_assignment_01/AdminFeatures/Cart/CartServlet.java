// Servlet: CartServlet
package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.e_commerce_web_application_assignment_01.DTO.CartItem;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";
    private static final long serialVersionUID = 1L;

    // Handle GET request - show the cart page
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Debugging line to check cart
        System.out.println("Cart size: " + cart.size());

        req.setAttribute("cart", cart);
        RequestDispatcher dispatcher = req.getRequestDispatcher("AddToCart.jsp");
        dispatcher.forward(req, resp);
    }


    // Handle POST request - add an item to the cart
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        boolean productExists = false;
        for (CartItem item : cart) {
            if (item.getProduct_id() == productId) {
                item.setQuantity(item.getQuantity() + quantity); // Update quantity
                item.setTotal_price(item.getPrice() * item.getQuantity()); // Update total
                productExists = true;
                break;
            }
        }

        if (!productExists) {
            try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)) {
                String query = "SELECT product_name, price FROM products WHERE product_id = ?";
                try (PreparedStatement stmt = connection.prepareStatement(query)) {
                    stmt.setInt(1, productId);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            String productName = rs.getString("product_name");
                            double price = rs.getDouble("price");

                            CartItem newItem = new CartItem(productId, productName, price, quantity);
                            newItem.setTotal_price(price * quantity); // Calculate total
                            cart.add(newItem);
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
                return;
            }
        }

        // Forward instead of redirecting
        req.setAttribute("cart", cart);
        RequestDispatcher dispatcher = req.getRequestDispatcher("AddToCart.jsp");
        dispatcher.forward(req, resp);
    }


}



