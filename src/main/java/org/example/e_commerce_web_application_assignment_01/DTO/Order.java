package org.example.e_commerce_web_application_assignment_01.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Order {
    private int user_id;
    private List<CartItem> items;
    private Double total_price;

    public Order(int userId, List<CartItem> cart) {
        this.user_id = userId;
        this.items = cart;
    }


}
