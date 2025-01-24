package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Item;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.e_commerce_web_application_assignment_01.DTO.Category;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ItemSaveServlet", value = "/ItemSave")
@MultipartConfig(maxFileSize = 169999999)
public class ItemSave extends HttpServlet {
    String DATABASE_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DATABASE_USER = "root";
    String DATABASE_PASSWORD = "Ijse@1234";
    private static final String UPLOAD_DIR = "uploads/images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_name = request.getParameter("product_name");
        String categoryIdString = request.getParameter("category_id");
        int category_id = 0;
        if (categoryIdString != null && !categoryIdString.isEmpty()) {
            try {
                category_id = Integer.parseInt(categoryIdString);
            } catch (NumberFormatException e) {
                // Log error or handle it as needed
                response.sendRedirect("ItemSave.jsp?message=Invalid category ID!");
                return;
            }
        }
        String description = request.getParameter("description");
        String priceString = request.getParameter("price");
        Double price = 0.0;
        if (priceString != null && !priceString.isEmpty()) {
            try {
                price = Double.valueOf(priceString);
            } catch (NumberFormatException e) {
                // Log error or handle it as needed
                response.sendRedirect("ItemSave.jsp?message=Invalid price!");
                return;
            }
        }

        String stockQuantityString = request.getParameter("stock_quantity");
        int stock_quantity = 0;
        if (stockQuantityString != null && !stockQuantityString.isEmpty()) {
            try {
                stock_quantity = Integer.parseInt(stockQuantityString);
            } catch (NumberFormatException e) {
                // Log error or handle it as needed
                response.sendRedirect("ItemSave.jsp?message=Invalid stock quantity!");
                return;
            }
        }
        Part profileImage = request.getPart("profileImage");

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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DATABASE_URL,
                    DATABASE_USER,
                    DATABASE_PASSWORD
            );

            String sql = "INSERT INTO products (product_name, category_id, description, price, stock_quantity, image_path) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product_name);
            preparedStatement.setInt(2, category_id);
            preparedStatement.setString(3, description);
            preparedStatement.setDouble(4, price);
            preparedStatement.setInt(5, stock_quantity);

            if (imagePath != null) {
                InputStream imageStream = profileImage.getInputStream();
                preparedStatement.setString(6, imagePath);
                System.out.println(profileImage);
            } else {
                preparedStatement.setNull(6, Types.VARCHAR);
            }

            int effectedRowCount = preparedStatement.executeUpdate();
            if (effectedRowCount > 0) {
                response.sendRedirect(
                        "ItemSave.jsp?message=Product Added Successfully! :)"
                );
            } else {
                response.sendRedirect(
                        "ItemSave.jsp?message=Failed To Add Product!! :("
                );
            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private String getFileName(Part profileImage) {
        String contentDisposition = profileImage.getHeader("Content-Disposition");
        for (String cotent : contentDisposition.split(";")) {
            if (cotent.trim().startsWith("filename")) {
                return cotent.substring(cotent.indexOf("=") + 2, cotent.length() - 1);
            }
        }
        return null;
    }

    private String getFileExtension(String fileName) {
       int doIndex = fileName.lastIndexOf(".");
       return (doIndex > 0) ? fileName.substring(doIndex) : "";
    }


}
