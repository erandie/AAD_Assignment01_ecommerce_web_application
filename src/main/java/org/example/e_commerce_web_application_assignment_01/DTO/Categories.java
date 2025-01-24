package org.example.e_commerce_web_application_assignment_01.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Categories {
    private int category_id;
    private String category_name;
    private String description;
    private String image_path;
}
