package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Item;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.Item;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetItems", value = "/LoadAllItems")
public class GetItems extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Item> items = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );
            String sql = "SELECT * FROM products";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                Item item = new Item(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getDouble(5),
                        resultSet.getInt(6),
                        resultSet.getString(7)
                );

                items.add(item);
            }

            req.setAttribute("items", items);

            RequestDispatcher dispatcher = req.getRequestDispatcher("LoadAllItems.jsp");

            dispatcher.forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
