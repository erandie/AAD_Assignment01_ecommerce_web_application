package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.CartItem;
import org.example.e_commerce_web_application_assignment_01.DTO.Item;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String productIdParam = req.getParameter("product_id");
        String quantityParam = req.getParameter("quantity");

        if (productIdParam == null || quantityParam == null) {
            throw new IllegalArgumentException("Product id or quantity is missing!");
        }

        int product_id = Integer.parseInt(productIdParam);
        int quantity = Integer.parseInt(quantityParam);

        Item item = null;
        try {
            item = getItemById(product_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (item == null) {
            throw new IllegalArgumentException("Product Not Found!");
        }

        CartHandle cart = (CartHandle) req.getSession().getAttribute("cartHandle");
        if (cart == null) {
            cart = new CartHandle();
            req.getSession().setAttribute("cart", cart);
        }

        CartItem cartItem = new CartItem(item.getProduct_id(), item.getName(), item.getQty(), item.getAmount());
        cart.addItem(cartItem);

        resp.sendRedirect("DisplayCart.jsp");

    }

    private Item getItemById(int productId) throws SQLException {
        try (Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD)){
            String sql = "SELECT * FROM products WHERE product_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, productId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    return new Item(
                            resultSet.getInt("product_id"),
                            resultSet.getString("product_name"),
                            resultSet.getString("description"),
                            resultSet.getDouble("price"),
                            resultSet.getInt("stock_quantity")
                    );
                }
            }
        }
        return null;
    }

   /* private List<Item> getItemList() {
        List<Item> items = new ArrayList<>();
        return null;
    }*/
}
