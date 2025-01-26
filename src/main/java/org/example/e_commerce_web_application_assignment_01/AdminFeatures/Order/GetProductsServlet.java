package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Order;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.Item;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetProductsServlet", value = "/GetProducts")
public class GetProductsServlet extends HttpServlet {
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        List<Item> products = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);
            String sql = "SELECT product_id, product_name, category_id, description, price, stock_quantity, image_path FROM products";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Item product = new Item(resultSet.getInt("product_id"),
                        resultSet.getString("product_name"),
                        resultSet.getInt("category_id"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price"),
                        resultSet.getInt("stock_quantity"),
                        resultSet.getString("image_path"));
                products.add(product);
            }

            Gson gson = new Gson();
            PrintWriter out = resp.getWriter();
            out.print(gson.toJson(products));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch products");
        }
    }
}
