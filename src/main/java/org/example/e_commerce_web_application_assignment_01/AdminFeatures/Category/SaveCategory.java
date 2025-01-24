package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Category;

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
import java.sql.*;
import java.util.UUID;

@WebServlet(name = "SaveCategory", value = "/CategorySave")
@MultipartConfig(maxFileSize = 169999999)
public class SaveCategory extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";
    private static final String UPLOAD_DIR = "uploads/images";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category_name = req.getParameter("category_name");
        String description = req.getParameter("description");
        Part category_image = req.getPart("category_image");

        String image_path = null;
        if (category_image != null) {
            String fileName = getFileName(category_image);
            String extension = getFileExtension(fileName);

            String uniqueFileName = UUID.randomUUID().toString() + extension;
            Path uploadPath = Path.of(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR, uniqueFileName);

            File uploadDir = new File(uploadPath.getParent().toString());
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            try (InputStream inputStream = category_image.getInputStream()){
                Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING);
            }

            image_path = UPLOAD_DIR + "/" + uniqueFileName;

        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql = "INSERT INTO categories (category_name, description, image_path) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category_name);
            preparedStatement.setString(2, description);

            if (image_path != null) {
                InputStream inputStream = category_image.getInputStream();
                preparedStatement.setString(3, image_path);
            } else {
                preparedStatement.setNull(3, Types.BLOB);
            }

            int effectedRows = preparedStatement.executeUpdate();
            if (effectedRows > 0) {
                resp.sendRedirect(
                        "CategorySave.jsp?message=Category saved successfully! :)"
                );
            } else {
                resp.sendRedirect(
                        "CategorySave.jsp?message=Failed To Save Category,Please Try Again! :( "
                );
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    private String getFileName(Part categoryImage) {
        String contentDisposition = categoryImage.getHeader("Content-Disposition");
        for (String content : contentDisposition.split(";")) {
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
