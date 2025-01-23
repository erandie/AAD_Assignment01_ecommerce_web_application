package org.example.e_commerce_web_application_assignment_01.AdminFeatures.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet(name = "UserSaveServlet", value = "/UserAuthentication")
@MultipartConfig(maxFileSize = 169999999)
public class UserSaveServlet extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";
    private static final String UPLOAD_DIR = "uploads/images";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String role = req.getParameter("role");
        String password = req.getParameter("password");
        Part profileImage = req.getPart("profileImage");

        String imagePath = null;
        if (profileImage != null) {
            String fileName = getFileName(profileImage);
            String extension = getFileExtension(fileName);

            String uniqueFileName = UUID.randomUUID().toString() + extension;
            Path uploadPath = Path.of(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR, uniqueFileName);

            File uploadDir = new File(uploadPath.getParent().toString());
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            try (InputStream inputStream = profileImage.getInputStream()){
                Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING);
            }

            imagePath = UPLOAD_DIR + "/" + uniqueFileName;

        }


        if (name == null || name.isEmpty() ||
                userName == null || userName.isEmpty() ||
                email == null || email.isEmpty() ||
                role == null || role.isEmpty() ||
                password == null || password.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("All fields are required, including the image.");
            return;
        }

       /* if (name == null || userName == null || email == null || role == null || password == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("All fields are required.");
            return;
        }*/

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql = "INSERT INTO user (name, userName, email, role, password, image_path) VALUES (?,?,?,?,?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, role);
            preparedStatement.setString(5, password);

            if (imagePath != null) {
                InputStream imageStream = profileImage.getInputStream();
                preparedStatement.setString(6, imagePath);
            } else {
                preparedStatement.setNull(6, java.sql.Types.BLOB);
            }

            int effectedRowCount = preparedStatement.executeUpdate();
            if (effectedRowCount > 0) {
                resp.sendRedirect(
                        "UserAuthentication.jsp?message=User saved Successfully!"
                );
            } else {
                resp.sendRedirect(
                        "UserAuthentication.jsp?message=Failed to save User!"
                );
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();  // Print the full stack trace
            // Optionally, log the error to a file for better tracking
            System.out.println("Error details: " + e.getMessage());
            resp.sendRedirect("UserAuthentication.jsp?error=An error occurred while saving user.");
        }

    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("Content-Disposition");
        for (String content : contentDisposition.split(";")){
            if (content.trim().startsWith("filename")){
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    private String getFileExtension(String fileName) {
        int doIndex = fileName.lastIndexOf(".");
        return (doIndex > 0) ? fileName.substring(doIndex) : "";
    }


}
