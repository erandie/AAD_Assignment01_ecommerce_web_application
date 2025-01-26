package org.example.e_commerce_web_application_assignment_01.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CartItem {
   private int id;
   private int product_id;
   private String product_name;
   private double price;
   private int quantity;
   @Getter
   @Setter
   private double total_price;
   private int user_id;

   public CartItem(int productId, String productName, double price, int quantity) {

   }

   // Constructor, getters and setters

}
