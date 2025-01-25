package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import org.example.e_commerce_web_application_assignment_01.DTO.CartItem;

import java.util.HashMap;
import java.util.Map;

public class CartHandle {
    private Map<Integer, CartItem> items = new HashMap<>();

    public void addItem(CartItem item){
        items.put(item.getProduct_id(), item);
    }

    public void addUser(CartItem user){
        items.put(user.getUser_id(), user);
    }

    public void updatedItemQuantity(int product_id, int quantity){
        CartItem item = items.get(product_id);
        if (item != null){
            item.setQuantity(quantity);
        }
    }

    public void removeItem(int product_id){
        items.remove(product_id);
    }

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }


}
