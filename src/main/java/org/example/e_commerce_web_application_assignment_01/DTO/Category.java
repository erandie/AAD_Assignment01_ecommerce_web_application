package org.example.e_commerce_web_application_assignment_01.DTO;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Getter
@Setter
public class Category {
    private int categoryId;
    private String categoryName;
    private String description;
    private String image_path;

    public Category(int categoryId, String categoryName, String description) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
        this.image_path = image_path;
    }

    public Category(String categoryName, String description, String imagePath) {
        this.categoryName = categoryName;
        this.description = description;
        this.image_path = image_path;
    }


    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }


    public String getDescription() {
        return description;
    }

    public String getImage_path() {
        return image_path;
    }
}
