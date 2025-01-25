package org.example.e_commerce_web_application_assignment_01.AdminFeatures.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "RemoveProductFromCart", value = "/RemoveProductFromCart")
public class RemoveProductFromCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int product_id = Integer.parseInt(req.getParameter("product_id"));

        CartHandle cart = (CartHandle) req.getSession().getAttribute("cart");
        if (cart != null) {
            cart.removeItem(product_id);
        }

        resp.sendRedirect("DisplayCart.jsp");

    }
}
