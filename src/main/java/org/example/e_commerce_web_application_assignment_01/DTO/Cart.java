package org.example.e_commerce_web_application_assignment_01.DTO;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;  // List of CartItem objects

    public Cart() {
        this.items = new ArrayList<>();  // Initialize the list of items
    }

    // Add item to the cart
    public void addItem(CartItem item) {
        items.add(item);
    }

    // Remove item from the cart by product ID
    public void removeItem(int productId) {
        items.removeIf(item -> item.getProduct_id() == productId);  // Remove by product ID
    }

    // Get the list of items in the cart
    public List<CartItem> getItems() {
        return items;
    }

    // Calculate the total price of all items in the cart
    /*public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getTotalPrice();  // Add up the total price of each item
        }
        return total;
    }*/

    // Update the quantity of an item in the cart
    public void updateItemQuantity(int productId, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct_id() == productId) {
                item.setQuantity(quantity);  // Update the quantity
                break;
            }
        }
    }
}
