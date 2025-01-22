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

@WebServlet(name = "ItemUpdate", value = "/Item_Update")
public class ItemUpdate extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("ItemUpdate.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product_id = req.getParameter("product_id");
        String product_name = req.getParameter("product_name");
        String category_id = req.getParameter("category_id");
        String description = req.getParameter("description");
        String price = req.getParameter("price");
        String qty = req.getParameter("stock_quantity");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql = "UPDATE products SET product_name=?, category_id=?, description=?, price=?, stock_quantity=? WHERE product_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, product_name);
            preparedStatement.setString(2, category_id);
            preparedStatement.setString(3, description);
            preparedStatement.setString(4, price);
            preparedStatement.setString(5, qty);
            preparedStatement.setString(6, product_id);

            int effectedRowCount = preparedStatement.executeUpdate();
            if (effectedRowCount > 0) {
                resp.sendRedirect(
                        "ItemUpdate.jsp?message=Product Updated successfully!! :)"
                );
            } else {
                resp.sendRedirect(
                        "ItemUpdate.jsp?error=Failed To Update Product, Please Try Again! :("
                );
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}























