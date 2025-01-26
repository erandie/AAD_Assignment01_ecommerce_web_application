package org.example.e_commerce_web_application_assignment_01.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Item {
    private int product_id;
    private String name;
    private int category;
    private String description;
    private Double amount;
    private int qty;
    private String imagePath;

    public Item(int product_id, String name, Double amount) {
        this.product_id = product_id;
        this.name = name;
        this.description = description;
        this.amount = amount;
        this.qty = qty;
    }

}
