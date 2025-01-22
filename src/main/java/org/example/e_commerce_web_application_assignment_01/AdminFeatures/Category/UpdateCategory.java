package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Category;

import com.mysql.cj.jdbc.Driver;
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

@WebServlet(name = "UpdateCategory", value = "/update_category")
public class UpdateCategory extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("CategoryUpdate.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("category_id");
        String name = req.getParameter("category_name");
        String description = req.getParameter("description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql = "UPDATE categories SET category_name=?, description=? WHERE category_id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, id);

            int effectedRowCount = preparedStatement.executeUpdate();
            if (effectedRowCount > 0) {
                resp.sendRedirect(
                        "CategoryUpdate.jsp?message=Category Updated Successfully!! :)"
                );
            } else {
                resp.sendRedirect(
                        "CategoryUpdate.jsp?error=Failed to update Category, please try again!! :("
                );
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}

























