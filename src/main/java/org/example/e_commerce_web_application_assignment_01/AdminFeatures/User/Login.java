/*
package org.example.e_commerce_web_application_assignment_01.AdminFeatures.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.User;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "Login", value = "/Login")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@1234";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("user_name");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT user_id, name, email, role, password, role FROM user WHERE userName = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, userName);

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                int user_id = rs.getInt("user_id");
                String userName = rs.getString("userName");
                String email = rs.getString("email");
                int role = rs.getInt("role");
                String password = rs.getString("password");

                boolean isPasswordEncrypted = isPasswordEncrypted(storedPassword);

                if (isPasswordEncrypted) {
                    if (PasswordUtil.checkPassword(password, storedPassword)) {
                        User user = new User(id, userName, email, number, storedPassword, role);
                        req.getSession().setAttribute("customer", customer);

                        if ("customer".equals(role)) {
                            resp.sendRedirect("customerDash.jsp");
                        } else if ("admin".equals(role)) {
                            resp.sendRedirect("dashboard.jsp");
                        } else {
                            resp.sendRedirect("login.jsp?error=Invalid role");
                        }
                    } else {
                        resp.sendRedirect("login.jsp?error=Invalid name or password");
                    }
                } else {
                    if (password.equals(storedPassword)) {
                        User user = new User(user_id, name, userName, email, role, password);
                        req.getSession().setAttribute("user", user);
                        if ("user".equals(role)) {
                            resp.sendRedirect("userDashboard.jsp");
                        } else if ("admin".equals(role)) {
                            resp.sendRedirect("AdminDashboard.jsp");
                        } else {
                            resp.sendRedirect("login.jsp?error=Invalid role");
                        }
                    } else {
                        resp.sendRedirect("login.jsp?error=Invalid name or password");
                    }
                }
            } else {
                resp.sendRedirect("index.jsp?error=Invalid name or password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=An error occurred. Please try again.");
        }
    }

    private boolean isPasswordEncrypted(String password) {
        return password != null && password.matches("^\\$2[aby]\\$\\d{2}\\$[A-Za-z0-9./]{53}$");
    }
}
*/
