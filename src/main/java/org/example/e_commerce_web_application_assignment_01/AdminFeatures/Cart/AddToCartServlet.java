package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.e_commerce_web_application_assignment_01.DTO.CartItem;
import org.example.e_commerce_web_application_assignment_01.DTO.Item;

import java.io.IOException;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Item item = getItemById(product_id);

        CartHandle cart = (CartHandle) req.getSession().getAttribute("cartHandle");
        if (cart == null) {
            cart = new CartHandle();
            req.getSession().setAttribute("cart", cart);
        }

        CartItem cartItem = new CartItem(item.getProduct_id(), item.getName(), item.getQty(), item.getAmount());
        cart.addItem(cartItem);

        resp.sendRedirect("DisplayCart.jsp");

    }

    private Item getItemById(int productId) {
        return null;
    }
}
